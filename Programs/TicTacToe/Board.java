public class Board {
	private Space[][] game;    // Stores current progress of the ongoing game

	// Constructor
	public Board() {
		game = new Space[3][3];
		for (int i = 0; i < 3; ++i) {
			for (int j = 0; j < 3; ++j) {
				game[i][j] = new Space();
			}
		}
	}

	// Occupies any valid Space
	public boolean place(char player, int row, int col) {
		if (game[row][col].checkSpace()) {    // Space is empty and valid
			game[row][col].setSpace(player);
			return true;
		}
		else {
			return false;
		}
	}

	// Displays game
	public void display() {
		System.out.println();
		for (int i = 0; i < 3; ++i) {
			System.out.print("    ");
			for (int j = 0; j < 3; ++j) {
				System.out.print(game[i][j].getLetter());
				if (j != 2) {
					System.out.print("|");
				}
			}
			System.out.println();
			if (i != 2) {
				System.out.println("   -------");
			}
		}
	}
}