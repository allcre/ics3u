float circleX; // x-coordinate of the circle
float circleY; // y-coordinate of the circle
float size; // diameter of the circle

void setup() {
  size(600, 600); //size of the run window, global variables width and height have value of 600
  stroke(11, 31, 227); //blue colour for the outline of the shapes
}

// remember all the code in here gets run over and over again
void draw() {

  //create a random float value for the x-coordinate of the circle from 0 to the width of the
  //run window
  circleX = random(width);  

  //create a random float value for the y-coordinate of the circle from 0 to the height of the
  //run window
  circleY = random(height);  

  //create a random float value for the diameter of the circle from 0 to 20;
  size = random(20);  

  //create a VERTICAL line that splits the run window into half
  line(width/2, 0, width/2, height); 

  // create the HORIZONTAL line that splits the run window into half
  line(0, height/2, width, height/2); 

  if (circleX < width/2 && circleY < height/2) {
    //draw the circle
    ellipse(circleX, circleY, size, size);
  }
}
