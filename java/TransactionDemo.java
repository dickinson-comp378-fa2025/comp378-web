import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TransactionDemo {

	// Increases the status of suppliers in San Francisco by 2 and
	// suppliers in Miami by 5. All changes are accomplished in a single
	// transaction.
	private static void increaseStatuses(QueryExecutor qe) {
		Connection connection = qe.getConnection();
		String update1 = "UPDATE `supplier` SET SUPSTATUS=SUPSTATUS+2 WHERE SUPCITY='San Francisco'";
		String update2 = "UPDATE `supplier` SET SUPSTATUS=SUPSTATUS+5 WHERE SUPCITY='Miami'";

		try (Statement statement = connection.createStatement()) {
			connection.setAutoCommit(false);
			System.out.println("AutoCommit is off.");

			statement.executeUpdate(update1);
			System.out.println("updated San Francisco");

			statement.executeUpdate(update2);
			System.out.println("updated Miami");

			connection.commit();
			System.out.println("Committed transaction.");

			connection.setAutoCommit(true);
			System.out.println("AutoCommit is on.");

		} catch (SQLException e) {
			System.out.println(
					"An exception was thrown during the transaction: "
							+ e.getMessage());
			try {
				System.out.print("Transaction is being rolled back");
				connection.rollback();
			} catch (SQLException e2) {
				qe.handleSQLException(e2);
			}
		}

	}

	public static void main(String[] args) {
		QueryExecutor qe = new QueryExecutor();

		increaseStatuses(qe);
		qe.executeQuery("SELECT * FROM `supplier`");
	}
}
