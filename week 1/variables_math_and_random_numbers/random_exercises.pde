// setting the width and height of the red rectangle
int rectWidth = (int) random(100, 200); 
int rectHeight = rectWidth/2; 

void setup() {
  size(610, 400);

  // rolling dice

  int roll1 = (int) random(1, 7); // first random roll
  int roll2 = (int) random(1, 7); // second random roll

  print("You rolled a " + roll1 + " and a " + roll2 + ".");
}

void draw() {
  
  // setting x and y coordinates to put the rectangle in the center of the window
  
  int x = width/2 - rectWidth/2;
  int y = height/2 - rectHeight/2;
  
  fill(255, 0, 0);
  rect(x, y, rectWidth, rectHeight); // drawing the red rectangle
  
  fill(0, 0, 255);
  rect(x + rectWidth + 5, y, rectWidth, rectHeight); // blue rectangle 5px to the right of the red

  fill(0, 255, 0);
  rect(x - rectWidth - 5, y, rectWidth, rectHeight); // green rectangle 5px to the left of the red
}
