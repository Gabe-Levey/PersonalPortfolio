public class Space {
	private char letter;    // Determines which player occupies the Space
	private boolean isValid;    // Keeps track of wheatear or not Space is occupied

	// Constructor
	public Space() {
		letter = ' ';
		isValid = true;
	}

	// Returns letter
	public char getLetter() {
		return letter;
	}

	// Returns isValid
	public boolean checkSpace() {
		return isValid;
	}

	// Sets letter to assigned value and isValid to false
	public void setSpace(char letter) {
		this.letter = letter;
		isValid = false;
	}
}