void setup() {
  size(675, 675);
}

void draw() {
  background(#91ADC2); // pale blue background

  if (atHomeScreen) {
    homeScreen();
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
  
  if (mouseX > 8 && mouseX < 51 && mouseY < (height - 9) && mouseY > (height - 49))
    atHomeScreen = true;
}
