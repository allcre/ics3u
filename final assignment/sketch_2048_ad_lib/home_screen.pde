int modeX, easyY, normalY, hardY;
int modeWidth, modeHeight, modeSpacing;
color navy;

void homeScreen() {
  
  board = new Gameplay(); // resets the game so a new board is made
  
  textFont(loadFont("ProcessingSansPro-Semibold-48.vlw"));
  fill(255); // white
  textSize(70);
  textAlign(LEFT, TOP);
  text("2048: Ad Libitium", 42, 98); // title
  textSize(35);
  text("a game by allison cretel", 41.73, 185); // subtitle
  navy = color(#003249);
  
  // buttons 
  modeSpacing = 82; // vertical space between the tops of the buttons
  modeWidth = 276;
  modeHeight = 53;
  modeX = 200;
  easyY = 319;
  normalY = easyY + modeSpacing;
  hardY = easyY + modeSpacing * 2;
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
