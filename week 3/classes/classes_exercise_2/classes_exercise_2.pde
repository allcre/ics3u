// declaring objects
Squarebox box1;
Squarebox box2;
Squarebox box3;

void setup() {
  size(500, 500);

  // initilaizing the boxes
  box1 = new Squarebox(50, 200, 200);
  box2 = new Squarebox(75, 80, 80);
  box3 = new Squarebox(150, 300, 300);
}

void draw() {
  background(100);

  // calling the display and move methods for each box
  box1.display();
  box1.move();
  box2.display();
  box2.move();
  box3.display();
  box3.move();
}

// Squarebox class 

class Squarebox {

  float length; // side length of the box
  float x; // x position of the box
  float y; // y position of the box

  // constructor
  Squarebox(float tempLength, float tempX, float tempY) {
    // passing variables from the arguments to variables for the class
    length = tempLength;
    x = tempX;
    y = tempY;
  }

  // display method to draw the box on the screen
  void display() {
    fill(125, 94, 67); // brown
    rect(x, y, length, length); // front face of the box
    quad(x, y, x + length/4, y - length/2, x + length/4 + length, y - length/2, x + length, y); // top side of box
    quad(x + length, y, x + length/4  + length, y - length/2, x + length/4 + length, y + length/2, x + length, y + length); // right side of box
  }

  // move method to change the postion of the box
  void move() {
    x += 1; // add one to x coordinate

    if (x > width) // if off the screen
      x = 0 - length * 5/4; // change x to just beyond the left side of the window
  }
}
