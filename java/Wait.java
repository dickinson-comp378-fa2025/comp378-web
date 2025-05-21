
public class Wait {
	public static void wait(String delay) {
		if (delay == null) {
			return;
		}
		int delaySeconds = 0;
		try {
			delaySeconds = Integer.parseInt(delay);
		} catch (NumberFormatException e) {
			System.out.println("NumberFormatException: expected an integer: " + e.getMessage());
			System.out.println();
			System.exit(0);
		}

		if (delaySeconds > 0) {
			System.out.format("Waiting for %d second%s...", delaySeconds, delaySeconds > 1 ? "s" : "");
			try {
				Thread.sleep(delaySeconds * 1000);
			} catch (InterruptedException e) {
				System.out.println("interrupted while waiting.");
				System.exit(0);
			}
			System.out.println("finished waiting");
		}
	}

}
