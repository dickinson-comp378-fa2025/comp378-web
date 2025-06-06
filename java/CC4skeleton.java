
public class CC4skeleton {
	public static void main(String[] args) {
		QueryExecutor qe = new QueryExecutor();

		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.9E  ////");
		System.out.println("////////////////////////////////");
		String qu7dot9E = ""
				+ "SELECT\n"
				+ "    s.SUPNAME,\n"
				+ "    s.SUPNR\n"
				+ "FROM\n"
				+ "    supplier s\n"
				+ "WHERE NOT\n"
				+ "    EXISTS(\n"
				+ "    SELECT\n"
				+ "        *\n"
				+ "    FROM\n"
				+ "        purchase_order p\n"
				+ "    WHERE\n"
				+ "        s.SUPNR = p.SUPNR\n"
				+ ")\n"
				+ "";
		qe.executeQuery(qu7dot9E);

		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.11E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.12E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.13E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.14E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.15E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.16E ////");
		System.out.println("////////////////////////////////");

		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.17E ////");
		System.out.println("////////////////////////////////");
		
		
		
		
		
		System.out.println("////////////////////////////////");
		System.out.println("//////////// Question 7.18E ////");
		System.out.println("////////////////////////////////");
		

		
		
		
		

		
		
		
		
		
		
		
	}

}
