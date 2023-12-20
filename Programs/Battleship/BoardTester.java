import java.util.Scanner;

public class BoardTester {
	public static void main(String[] args) {
		Scanner reader = new Scanner(System.in);
		Board player = new Board();
		int i = 0;

		while (i == 0) {
			int row = reader.nextInt();
			int col = reader.nextInt();
			player.addTile(row, col, new Tile("X"));
			player.print();
		}
	}
}