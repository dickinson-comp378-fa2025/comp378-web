import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class CC6skeleton {

	// For every existing order of red wine, increase the quantity by one.
	// For every existing order of sparkling wine whose quantity is two or
	// less, delete the order.
	// For every existing order of sparkling wine whose quantity is three
	// or greater, decrease the quantity by two.
	// All changes are accomplished in a single transaction.
	private static void changeOrders(QueryExecutor qe) {
		// Fill in this method for assignment CC6
	}

	public static void main(String[] args) {
		QueryExecutor qe = new QueryExecutor();

		changeOrders(qe);
		qe.executeQuery("SELECT * FROM `po_line`");
	}
}
