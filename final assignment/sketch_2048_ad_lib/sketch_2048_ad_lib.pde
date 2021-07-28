boolean atHomeScreen = true;
ScoreBox currentScoreBox;
ScoreBox highScoreBox;
boolean easyMode, normalMode, hardMode;
Gameplay board;
int highScore;
int moves; // keeps track of how many moves have been made
boolean rearranging; // if the program is in the rearranging mode or not
int numRearrange; // keeps track of how many times the board has been manually rearranged;
int originalI, originalJ, newI, newJ; // used for rearranging tiles
boolean moving; // used for keeping track if a tile is being moved manually

void setup() {
  size(675, 675);
  board = new Gameplay(); // make a board to start
}

void draw() {
  background(#91ADC2); // pale blue background

  if (atHomeScreen && !(easyMode || normalMode || hardMode)) {
    homeScreen();
  } else if (easyMode || normalMode || hardMode) {

    if (hardMode) {
      hardModeText();

      if (moves % 15 == 0 && moves != 0 && !(board.gameEnd)) { // if they won/lost the game, don't shuffle
        board.shuffleTiles();
        moves = 0;
      }
    }

    gameSetup();
    board.plainBoard();


    if (easyMode) {
      easyModeText();
    }

    // this block uses the normal display function if not in rearranging mode, otherwise the blocks are jiggling
    if (rearranging) {
      board.jiggleTiles();
      delay(60);

      if (moving) {
        board.moveTiles();
      }
    } else {
      board.showTiles();
    }

    if (board.gameEnd) {
      board.endScreen();
    }
  }

  helpIcon();
  homeIcon();

  if (atInstructions)
    instructions();
}

void mousePressed() {

  // opens or closes the instructions bubble when the help icon is clicked
  if (dist(mouseX, mouseY, helpCenter, helpCenter) < helpDiameter/2 + 2.5) { // +2.5 accounts for the stroke width
    if (atInstructions == true)
      atInstructions = false;
    else
      atInstructions = true;
  }

  // shows home screen if home button is clicked
  if (mouseX > 8 && mouseX < 51 && mouseY < (height - 9) && mouseY > (height - 49)) {
    atHomeScreen = true;
    easyMode = false;
    normalMode = false;
    hardMode = false;
  }

  // actions to start a game when a mode button is clicked

  if ((atHomeScreen) && mouseX > modeX && mouseX < (modeX + modeWidth)) {
    if (mouseY > easyY && mouseY < (easyY + modeHeight)) {
      easyMode = true;
    } else if (mouseY > (normalY) && mouseY < (normalY + modeHeight)) {
      normalMode = true;
    } else if (mouseY > (hardY) && mouseY < (hardY + modeHeight)) {
      hardMode = true;
    }

    // starting board with 2 tiles on it
    if (easyMode || normalMode || hardMode) {
      board.plainBoard();
      board.newTile();
      board.newTile();
      atHomeScreen = false;
    }
  }



  // gets the indexes of the tile that is clicked

  if (easyMode && !(atInstructions) && rearranging && (!(moving))) {
    // if the mouse is on the board
    if (mouseX > 116 && mouseX < (width - 116) && mouseY > 117 && mouseY < (height - 82)) {
      originalI = board.getI(mouseY);
      originalJ = board.getJ(mouseX);
      println(originalI);
      println(originalJ);
      moving = true;
    }
  }

  // some function
}

void mouseReleased() {

  // starts the rearrange mode (has to be at release or else the button is treated like a tile)
  if (easyMode && !(atInstructions) && !(board.gameEnd)) { // if the game isn't over and instructions aren't open
    if (mouseX > 254 && mouseX < 422 && mouseY > 611 && mouseY < 641 && numRearrange < 3) {
      if (rearranging) { // stops/starts the rearrange mode
        rearranging = false;
        numRearrange += 1;
      } else
        rearranging = true;
    }
  }

  if (rearranging && moving) {

    newI = board.getI(mouseY);
    newJ = board.getJ(mouseX);
    board.reassignTiles();
    moving = false;
  }
}

void keyPressed() {

  if ((easyMode || normalMode || hardMode) && !(atInstructions) && !(rearranging)) { // so players can't move around the tiles when the instructions are covering the board or in rearrange mode
    if (keyCode == 38 || keyCode == 87) {
      board.move("up");
    } else if (keyCode == 40 || keyCode == 83) {
      board.move("down");
    } else if (keyCode == 37 || keyCode == 65) {
      board.move("left");
    } else if (keyCode == 39 || keyCode == 68) {
      board.move("right");
    }

    if (board.moved &&
      (keyCode == 38 || keyCode == 87 || keyCode == 40 || keyCode == 83 ||
      keyCode == 37 || keyCode == 65 || keyCode == 39 || keyCode == 68)) {// if at least one tile moved/merged, add another to the board and check if the game ends
      board.newTile();
      board.checkEnd();
      moves++;
    }
  }
}
