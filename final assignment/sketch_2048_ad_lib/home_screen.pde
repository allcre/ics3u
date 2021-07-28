// sets up the home screen and resets all games

// data
int modeX, easyY, normalY, hardY; // button coordinates
int modeWidth, modeHeight, modeSpacing; // button measurements

// draws a home screen, resets games and most variables
void homeScreen() {

  highScore = board.highScore; // grab the high score from the previous round
  board = new Gameplay(); // make a new board
  board.highScore = highScore; // add the current high score to the new board

  // resetting variables
  board.gameEnd = false; // reset game end boolean
  board.won = false; // game is not won
  moves = 0; // move counter resets
  rearranging = false; // not rearranging tiles
  numRearrange = 0; // rearranges counter resets
  moving = false; // a tile isn't being moved
  // clear indexes that were stored
  originalI = 0;
  originalJ = 0;
  newI = 0;
  newJ = 0;

  // drawing elements on the home screen
  fill(255); // white
  textSize(70);
  textAlign(LEFT, TOP);
  text("2048: Ad Libitium", 42, 98); // title
  textSize(35);
  text("a game by allison cretel", 41.73, 185); // subtitle

  // buttons
  modeSpacing = 82; // distance from the top of one button to the top of the next button
  modeWidth = 276; // button width
  modeHeight = 53; // button height
  modeX = 200; // x-coordinate of buttons
  easyY = 319; // y-coordinate of easy button
  normalY = easyY + modeSpacing; // y-coordinate of normal button
  hardY = easyY + modeSpacing * 2; // y-coordinate of hard button

  // draw 3 buttons
  fill(navy);
  noStroke();
  rect(200, easyY, modeWidth, modeHeight, 10);
  rect(200, normalY, modeWidth, modeHeight, 10);
  rect(200, hardY, modeWidth, modeHeight, 10);

  // text on the buttons
  fill(255); // white
  textSize(24);
  text("easy", 315, 335);
  text("normal", 300, 335 + modeSpacing);
  text("hard", 312, 335 + modeSpacing * 2);
}
