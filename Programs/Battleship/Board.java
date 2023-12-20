public class Board {
	private Tile[][] square;    // 11x11 square; row 0 and column 0 used for labels; [0][0] is empty; rows A-J; columns 1-10

	// Constructor
	public Board() {
		square = new Tile[11][11];
		square[0][0] = new Tile("    ");
		String[] rows = {null, "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
		for (int i = 1; i < square.length; ++i) {
			square[i][0] = new Tile("   " + rows[i]);    // Row labels
			square[0][i] = new Tile(Integer.toString(i));    // Column labels
			for (int j = 1; j < square.length; ++j) {
				square[i][j] = null;
			}
		}
	}

	// Checks if the space is valid and empty, then places a Tile if it is
	public boolean addTile(int row, int col, Tile peg) {
		if ((row < 1 || row > 10) || (col < 1 || col > 10)) {    // Space is out of bounds
			System.out.println("invalid Tile placement");
			return false;
		}
		else if (square[row][col] == null) {    // Space is unoccupied
			square[row][col] = peg;
			System.out.println("valid Tile placement");
			return true;
		}
		else {    // Space is occupied
			System.out.println("invalid Tile placement");
			return false;
		}
	}

	// Displays square
	private void display() {
		System.out.println();
		for (int i = 0; i < square.length; ++i) {
			for (int j = 0; j < square.length; ++j) {
				if (square[i][j] == null) {
					System.out.print(" ");
				}
				else {
					System.out.print(square[i][j].getLabel());
				}
				if (j < square.length - 1) {
					System.out.print(" | ");
				}
			}
			System.out.println();
			if (i < square.length - 1) {
				System.out.println("  --------------------------------------------");
			}
		}
	}

	// Calls display() method
	public void print() {
		display();
	}
}