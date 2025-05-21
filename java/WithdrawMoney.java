import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class WithdrawMoney {
	enum LockType {
		NONE, READ, WRITE
	};

	private static boolean USE_TRANSACTION = false;
	private static LockType LOCK_TYPE = LockType.NONE;

	public static void usage() {
		String msg = "usage: java WithdrawMoney fromAccount amount [delay] [-r|-w] [-t]\n"
				+ "  fromAccount - the number of the account to withdraw from e.g. 111\n"
				+ "  amount - the amount to withdraw, e.g. 54.95\n"
				+ "  delay - number of seconds to wait between checking the balance\n"
				+ "          and withdrawing the money\n"
				+ "  -r - SELECT uses read locks\n"
				+ "  -w - SELECT uses write locks\n"
				+ "  -t - use a transaction";
		System.out.println(msg);
		System.exit(0);
	}

	public static void withdraw(QueryExecutor qe, String fromAccount,
			String amount, String delay) throws Exception {
		Connection connection = qe.getConnection();
		String getBalance = "SELECT `balance` FROM `accounts` WHERE `account_number`='%s'";
		if (LOCK_TYPE == LockType.READ) {
			getBalance += " LOCK IN SHARE MODE";
		} else if (LOCK_TYPE == LockType.WRITE) {
			getBalance += " FOR UPDATE";
		}

		String withdraw = "UPDATE `accounts` a SET a.balance=%s WHERE a.account_number=%s";

//		System.out.format("Initiating transfer from %s to %s.\n",
//				fromAccount, toAccount);

		try (Statement statement = connection.createStatement()) {

			/////////////////////////////////////////////////////
			// begin transaction
			/////////////////////////////////////////////////////
			if (USE_TRANSACTION) {
				System.out.println("Beginning transaction...");
				connection.setAutoCommit(false);
			}

			/////////////////////////////////////////////////////
			// check balance
			/////////////////////////////////////////////////////
			String cmd = String.format(getBalance, fromAccount);
			ResultSet resultSet = statement.executeQuery(cmd);
			System.out.println("Executed " + cmd);
			resultSet.next();
			BigDecimal balance = resultSet.getBigDecimal(1);
			System.out.format(
					"Checked balance: acount %s has balance %s\n",
					fromAccount, balance);

			/////////////////////////////////////////////////////
			// wait for 'delay' seconds
			/////////////////////////////////////////////////////
			Wait.wait(delay);

			/////////////////////////////////////////////////////
			// withdraw money if there are sufficient funds
			/////////////////////////////////////////////////////
			BigDecimal amountAsDec = new BigDecimal(amount);
			if (balance.compareTo(amountAsDec) >= 0) {
				BigDecimal newBalance = balance.subtract(amountAsDec);
				System.out.print("Beginning withdrawal...");
				statement.executeUpdate(
						String.format(withdraw, newBalance, fromAccount));
				System.out.println("completed.");
			} else {
				System.out.println("Insufficient funds.");
			}
			/////////////////////////////////////////////////////
			// end transaction
			/////////////////////////////////////////////////////
			if (USE_TRANSACTION) {
				System.out.print("Committing transaction...");
				connection.commit();
				System.out.println("completed.");
			}
		} catch (SQLException e) {
			if (USE_TRANSACTION) {
				System.out.println(
						"An exception was thrown during the transaction: "
								+ e.getMessage());
				qe.executeQuery("SELECT * FROM `accounts`");

				String msg = "Most likely, the transaction was already rolled back\n"
						+ "automatically by the database server. A rollback command will now\n"
						+ "be issued to guarantee this.";
				System.out.println(msg);
				try {
					connection.rollback();
					System.out.println("Rollback completed.");
				} catch (SQLException e2) {
					qe.handleSQLException(e2);
				}
			} else {
				System.out.println(
						"An exception was thrown during SQL execution: "
								+ e.getMessage());
				qe.executeQuery("SELECT * FROM `accounts`");
			}
		}
	}

	private static String[] removeLastElement(String[] args) {
		String[] newArgs = new String[args.length - 1];
		System.arraycopy(args, 0, newArgs, 0, args.length - 1);
		return newArgs;
	}

	public static void main(String[] args) throws Exception {
		if (args.length < 2) {
			usage();
		}

		if (args[args.length - 1].equals("-t")) {
			USE_TRANSACTION = true;
			args = removeLastElement(args);
		}

		if (args[args.length - 1].equals("-r")) {
			LOCK_TYPE = LockType.READ;
			args = removeLastElement(args);
		} else if (args[args.length - 1].equals("-w")) {
			LOCK_TYPE = LockType.WRITE;
			args = removeLastElement(args);
		}

		String fromAccount = args[0];
		String amount = args[1];
		String delay = null;
		if (args.length == 3) {
			delay = args[2];
		}

		QueryExecutor qe = new QueryExecutor("bank");

		System.out.println("\n--------------------------------");
		System.out.println("Balances before withdrawal:");
		System.out.println("--------------------------------");
		qe.executeQuery("SELECT * FROM `accounts`");
		System.out.println("--------------------------------\n");

		withdraw(qe, fromAccount, amount, delay);

		System.out.println("\n--------------------------------");
		System.out.println("Balances after withdrawal:");
		System.out.println("--------------------------------");
		qe.executeQuery("SELECT * FROM `accounts`");
		System.out.println("--------------------------------\n");
	}

}
