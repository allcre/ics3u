boolean atHomeScreen = true;
int score;
int highScore = 0;
ScoreBox currentScoreBox;
ScoreBox highScoreBox;
boolean easyMode, normalMode, hardMode;
Gameplay board; 

void setup() {
  size(675, 675);

  // ADD SCORE INSTRUCTIONS
}

void draw() {
  background(#91ADC2); // pale blue background

  if (atHomeScreen && !(easyMode || normalMode || hardMode)) {
    homeScreen();
  } else if (easyMode || normalMode || hardMode) {
    gameSetup();
    board.plainBoard();
    board.showTiles();
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
    }
  }

  if (easyMode || normalMode || hardMode) {
    //if (keyCode == 38 ||
  }
}

void keyPressed() {
  println(keyCode);
  println(key);

  if (easyMode || normalMode || hardMode) {
    if (keyCode == 38 || keyCode == 87) {
      board.move("up");
      board.newTile();
    } else if (keyCode == 40 || keyCode == 83) {
      board.move("down");
      board.newTile();
    } else if (keyCode == 37 || keyCode == 65) {
      board.move("left");
      board.newTile();
    } else if (keyCode == 39 || keyCode == 68) {
      board.move("right");
      board.newTile();
    }
  }
}
