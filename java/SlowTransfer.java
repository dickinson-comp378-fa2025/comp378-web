import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class SlowTransfer {

	public static void usage() {
		String msg = "usage: java SlowTransfer fromAccount toAccount amount delay\n"
				+ "  fromAccount - the number of the account to transfer from e.g. 111\n"
				+ "  toAccount - the number of the account to transfer to e.g. 222\n"
				+ "  amount - the amount to transfer, e.g. 54.95\n"
				+ "  delay - number of seconds to wait between the debit and credit";
		System.out.println(msg);
		System.exit(0);
	}

	public static void transfer(QueryExecutor qe, String fromAccount,
			String toAccount, String amount, String delay) {
		Connection connection = qe.getConnection();
		String withdraw = "UPDATE `accounts` a SET a.balance=a.balance-%s WHERE a.account_number=%s";
		String deposit = "UPDATE `accounts` a SET a.balance=a.balance+%s WHERE a.account_number=%s";

		System.out.format("Initiating transfer from %s to %s.\n",
				fromAccount, toAccount);

		try (Statement statement = connection.createStatement()) {

			/////////////////////////////////////////////////////
			// begin transaction
			/////////////////////////////////////////////////////
			connection.setAutoCommit(false);

			/////////////////////////////////////////////////////
			// withdraw from fromAccount
			/////////////////////////////////////////////////////
			System.out.print("Beginning withdrawal...");
			statement.executeUpdate(
					String.format(withdraw, amount, fromAccount));
			System.out.println("completed.");
//			qe.executeQuery("SELECT * FROM `accounts`");

			/////////////////////////////////////////////////////
			// wait for 'delay' seconds
			/////////////////////////////////////////////////////
			Wait.wait(delay);

			/////////////////////////////////////////////////////
			// deposit into toAccount
			/////////////////////////////////////////////////////
			System.out.print("Beginning deposit...");
			statement.executeUpdate(
					String.format(deposit, amount, toAccount));
			System.out.println("completed.");

			/////////////////////////////////////////////////////
			// end transaction
			/////////////////////////////////////////////////////
			System.out.print("Committing transaction...");
			connection.commit();
			System.out.println("completed.");

		} catch (SQLException e) {
			System.out.println(
					"An exception was thrown during the transaction: "
							+ e.getMessage());
//			qe.executeQuery("SELECT * FROM `accounts`");

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
		}
	}


	public static void main(String[] args) {
		if (args.length != 4) {
			usage();
		}

		String fromAccount = args[0];
		String toAccount = args[1];
		String amount = args[2];
		String delay = args[3];

		QueryExecutor qe = new QueryExecutor("bank");

		System.out.println("\n--------------------------------");
		System.out.println("Balances before transfer:");
		System.out.println("--------------------------------");
		qe.executeQuery("SELECT * FROM `accounts`");
		System.out.println("--------------------------------\n");

		transfer(qe, fromAccount, toAccount, amount, delay);

		System.out.println("\n--------------------------------");
		System.out.println("Balances after transfer:");
		System.out.println("--------------------------------");
		qe.executeQuery("SELECT * FROM `accounts`");
		System.out.println("--------------------------------\n");
	}

}
