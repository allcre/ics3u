int diceRoll1 = (int) random(1, 7); // selects a number from 1 to 6
int diceRoll2 = (int) random(1, 7); // selects another number from 1 to 6
String msg; // will hold the match or no match message

void setup() {
  size(450, 370);

  // drawing rectangles to display rolls and message
  fill(255, 255, 0);
  int width = 200;
  int x = 10;
  int y = 15;

  rect(x, y, width, width);
  rect(x + width + 30, y, width, width);
  rect(75, 260, 300, 80);

  // determining which message to display 
  if (diceRoll1 == diceRoll2) { // if the rolls are equal
    msg = "Match!";
  } else { // if the rolls are not equal
    msg = "No Match!";
  }
  
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(150);
  text(diceRoll1, 105, 107); // first dice roll 
  text(diceRoll2, 340, 107); // second dice roll
  
  textSize(50);
  text(msg, 225, 300);
}
