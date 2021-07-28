// main file

boolean atHomeScreen = true; // starting screen is the home one
boolean atInstructions = false; // by default the instructions page is not open

// scorebox objects for displaying the current score and the high score
ScoreBox currentScoreBox;
ScoreBox highScoreBox;

// booleans for keeping track of which mode the user selected
boolean easyMode, normalMode, hardMode;

// the main object that includes all the tiles in play
Gameplay board;

// high score variable
int highScore;

int moves; // keeps track of how many moves have been made

boolean rearranging; // tracks if the manual rearranging mode is turned on
boolean moving; // tracks if a tile is currently being dragged somewhere
int numRearrange; // keeps track of how many times the board has been manually rearranged

int originalI, originalJ, newI, newJ; // used for getting the indexes of tiles while manually rearranging them

void setup() {
  // window size
  size(675, 675);

  // make a board to start
  board = new Gameplay();
}

void draw() {
  background(#91ADC2); // pale blue background

  // if at the home screen and not playing a game run the home screen method
  if (atHomeScreen && !(easyMode || normalMode || hardMode)) {
    homeScreen();
  } else if (easyMode || normalMode || hardMode) { // if in a game

    if (hardMode) { // if in hard mode
      hardModeText(); // display the appropriate text for hard mode

      // tracks when to shuffle tiles (every 15 moves)
      if (moves % 15 == 0 && moves != 0 && !(board.gameEnd)) { // if they won/lost the game, don't shuffle
        board.shuffleTiles(); // shuffle tiles
        moves = 0; // reset move counter to 0
      }
    }

    // basic game setup that draws the playing board and other static features for every mode
    gameSetup();
    board.plainBoard();

    if (easyMode) // if playing in easy mode, display the appropriate easy mode text
      easyModeText();

    // this block uses the normal display function if not in rearranging mode, otherwise the blocks are jiggling
    if (rearranging) {
      board.jiggleTiles(); // wiggle all the tiles
      delay(60); // delay so the tiles aren't shaking very quickly

      // if a tile is manually being moved, run the moving funtion
      if (moving)
        board.moveTiles();
    }

    // if not in jiggle mode, display the tiles normally
    else
      board.showTiles();

    // if the game ended, show the end screen
    if (board.gameEnd)
      board.endScreen();
  }

  // show the help icon and home icon all the time
  helpIcon();
  homeIcon();

  // if the help icon was clicked, show instructions
  if (atInstructions)
    instructions();
}

// method that runs when the mouse is pressed
void mousePressed() {

  // opens or closes the instructions bubble when the help icon is clicked
  if (dist(mouseX, mouseY, helpCenter, helpCenter) < helpDiameter/2 + 2.5) { // +2.5 accounts for the stroke width
    if (atInstructions == true)
      atInstructions = false;
    else
      atInstructions = true;
  }

  // shows home screen if the home button is clicked
  if (mouseX > 8 && mouseX < 51 && mouseY < (height - 9) && mouseY > (height - 49)) {
    atHomeScreen = true;
    // end all games
    easyMode = false;
    normalMode = false;
    hardMode = false;
  }

  // actions to start a game when a mode button is clicked

  if ((atHomeScreen) && mouseX > modeX && mouseX < (modeX + modeWidth)) {
    if (mouseY > easyY && mouseY < (easyY + modeHeight)) { // if the easy button was clicked
      easyMode = true;
    } else if (mouseY > (normalY) && mouseY < (normalY + modeHeight)) { // if the normal button was clicked
      normalMode = true;
    } else if (mouseY > (hardY) && mouseY < (hardY + modeHeight)) { // if the hard button was clicked
      hardMode = true;
    }

    // if any game started, make a new plain board with 2 tiles on it
    if (easyMode || normalMode || hardMode) {
      board.plainBoard();
      board.newTile();
      board.newTile();
      atHomeScreen = false; // stop the home screen function from running
    }
  }

  // gets the indexes of the tile that is clicked while rearranging tiles, but a tile is not being moved at the moment (only applicable for easy mode)
  if (easyMode && !(atInstructions) && rearranging && (!(moving))) {
    if (mouseX > 116 && mouseX < (width - 116) && mouseY > 117 && mouseY < (height - 82)) { // if the mouse is within the board
      // calling methods to store the index values in variables
      originalI = board.getI(mouseY);
      originalJ = board.getJ(mouseX);
      moving = true; // now a tile is currently being moved because it's been clicked
    }
  }
}

// called when a mouse click is released
void mouseReleased() {
  // starts the rearrange mode
  if (easyMode && !(atInstructions) && !(board.gameEnd)) { // if the game isn't over and instructions aren't open
    if (mouseX > 254 && mouseX < 422 && mouseY > 611 && mouseY < 641 && numRearrange < 3) { // if the rearrange button is clicked
      // stop or start the rearranging mode
      if (rearranging) {
        rearranging = false;
        numRearrange += 1; // keeps track of how many times the tiles have been rearranged
      } else
        rearranging = true;
    }
  }

  // while a tile was being moved and is dropped
  if (rearranging && moving) {
    // grab the new index values of the space
    newI = board.getI(mouseY);
    newJ = board.getJ(mouseX);
    // reassign the tile to that spot if applicable
    board.reassignTiles();
    moving = false; // a tile is no longer being moved
  }
}

// called when any key is pressed
void keyPressed() {

  // if during a game mode and instructions aren't open and tiles are not being rearranged
  if ((easyMode || normalMode || hardMode) && !(atInstructions) && !(rearranging)) {
    // run a function that moves the tiles in the appropriate direction
    if (keyCode == 38 || keyCode == 87) { // up arrow or W
      board.move("up");
    } else if (keyCode == 40 || keyCode == 83) { // down arrow or S
      board.move("down");
    } else if (keyCode == 37 || keyCode == 65) { // left arrow or A
      board.move("left");
    } else if (keyCode == 39 || keyCode == 68) { // right arrow or D
      board.move("right");
    }

    // if at least one tile moved/merged and a valid key was pressed, add a new tile to the board and check if the game ends
    if (board.moved &&
      (keyCode == 38 || keyCode == 87 || keyCode == 40 || keyCode == 83 ||
      keyCode == 37 || keyCode == 65 || keyCode == 39 || keyCode == 68)) {
      board.newTile();
      board.checkEnd();
      moves++; // add one to the number of moves made
    }
  }
}
