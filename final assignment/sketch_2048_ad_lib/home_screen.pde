boolean atHomeScreen = true;
int easyX, easyY, normalX, normalY, hardX, hardY;
int modeWidth, modeHeight;
color navy;

void homeScreen() {
  textFont(loadFont("ProcessingSansPro-Semibold-48.vlw"));
  fill(255); // white
  textSize(70);
  textAlign(LEFT, TOP);
  text("2048: Ad Libitium", 42, 98); // title
  textSize(35);
  text("a game by allison cretel", 41.73, 188.01); // subtitle
  navy = color(#003249);
  
  // buttons 
  int modeSpacing = 82; // vertical space between the tops of the buttons
  modeWidth = 276;
  modeHeight = 53;
  fill(navy);
  noStroke();
  rect(200, 319, modeWidth, modeHeight, 10);
  rect(200, 319 + modeSpacing, modeWidth, modeHeight, 10);
  rect(200, 319 + modeSpacing * 2, modeWidth, modeHeight, 10);
  
  // text on the buttons
  fill(255); // white
  textSize(24);
  text("easy", 315, 335);
  text("normal", 300, 335 + modeSpacing);
  text("hard", 312, 335 + modeSpacing * 2);
}
