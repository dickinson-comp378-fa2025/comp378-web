
public class CC4solution {

	public static void main(String[] args) {
		QueryExecutor qe = new QueryExecutor();

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.11E ////");
		System.out.println("////////////////////////////////");
		String qu7dot11E = "SELECT sum(p.AVAILABLE_QUANTITY) as TOTAL_QUANTITY FROM product p WHERE p.PRODTYPE='sparkling'";
		qe.executeQuery(qu7dot11E);

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.12E ////");
		System.out.println("////////////////////////////////");
		String qu7dot12E = "" + "SELECT\n" + "    s.SUPNR,\n"
				+ "    s.SUPNAME,\n" + "    COUNT(po.PONR) AS NUM_ORDERS\n"
				+ "FROM\n" + "    supplier s\n"
				+ "LEFT JOIN purchase_order po ON\n"
				+ "    s.SUPNR = po.SUPNR\n" + "GROUP BY\n"
				+ "    s.SUPNR\n";
		qe.executeQuery(qu7dot12E);

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.13E ////");
		System.out.println("////////////////////////////////");
		String qu7dot13E = "" + "SELECT\n" + "    s.SUPNR,\n"
				+ "    COUNT(s.PRODNR) AS NUM_PRODUCTS\n" + "FROM\n"
				+ "    supplies s\n" + "GROUP BY\n" + "    s.SUPNR\n"
				+ "HAVING\n" + "    COUNT(s.PRODNR) > 5\n";
		qe.executeQuery(qu7dot13E);

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.14E ////");
		System.out.println("////////////////////////////////");
		String qu7dot14E = "" + "SELECT\n" + "    s.SUPNR,\n"
				+ "    AVG(s.DELIV_PERIOD) AS AVG_DELIV_PERIOD\n"
				+ "FROM\n" + "    supplies s\n" + "GROUP BY\n"
				+ "    s.SUPNR\n";
		qe.executeQuery(qu7dot14E);

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.15E ////");
		System.out.println("////////////////////////////////");
		String qu7dot15E = "" + "SELECT DISTINCT\n" + "    line.PONR\n"
				+ "FROM\n" + "    po_line line\n" + "WHERE\n"
				+ "    line.PRODNR IN(\n" + "    SELECT\n"
				+ "        p.PRODNR\n" + "    FROM\n"
				+ "        product p\n" + "    WHERE\n"
				+ "        p.PRODTYPE = 'sparkling' OR p.PRODTYPE = 'red'\n"
				+ ")\n";
		qe.executeQuery(qu7dot15E);
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.16E ////");
		System.out.println("////////////////////////////////");
		String qu7dot16E = "SELECT P.PRODNR FROM PRODUCT P WHERE 3 >=( SELECT COUNT(*) FROM PRODUCT Q WHERE P.PRODNR >= Q.PRODNR )";
		qe.executeQuery(qu7dot16E);			

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.17E ////");
		System.out.println("////////////////////////////////");
		String qu7dot17E = "SELECT p.PRODNAME FROM product p WHERE p.AVAILABLE_QUANTITY >= ALL( SELECT q.AVAILABLE_QUANTITY FROM product q )";
		qe.executeQuery(qu7dot17E);			

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.18E ////");
		System.out.println("////////////////////////////////");
		String qu7dot18E = "SELECT s.SUPNAME, s.SUPNR FROM supplier s WHERE NOT EXISTS( SELECT * FROM supplier t WHERE t.SUPNR < s.SUPNR );";
		qe.executeQuery(qu7dot18E);			
	}

}
