boolean atHomeScreen = true;
int score = 0;
int highScore = 0;
ScoreBox currentScoreBox;
ScoreBox highScoreBox;

void setup() {
  size(675, 675);
}

void draw() {
  background(#91ADC2); // pale blue background

  if (atHomeScreen && !(easyMode || normalMode || hardMode)) {
    homeScreen();
  } 
  else if (easyMode || normalMode || hardMode) {
    gameSetup();
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
    }
    else if (mouseY > (normalY) && mouseY < (normalY + modeHeight)) {
      normalMode = true;
    }
    else if (mouseY > (hardY) && mouseY < (hardY + modeHeight)) {
      hardMode = true;
    }
  }
}
