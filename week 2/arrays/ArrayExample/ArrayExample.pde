int [] x; // declare an array to store the different x positions
int [] xSpeed;
color [] colours;

void setup() {
  size(500, 500); // screen size

  x = new int [10]; // initialize the array to have room to store 10 integers
  xSpeed = new int [10];
  colours = new color [10];

  fill(0, 0, 255); // make circles blue
  for (int index = 0; index <= 9; index = index + 1) { // the variable index goes through each spot in the array
    x[index] = 15 * index; // set each array spot to 15
    ellipse(x[index], 50 + index * 40, 30, 30); // draw the circle with the current array value
    xSpeed[index] = (int) random(1, 15);
    colours[index] = color(random(255), random(255), random(255));
  }
}

void draw() { 
  background(125); 
  // loop to update the x values
  for (int index = 0; index <= 9; index = index + 1) {
    x[index] = x[index] + xSpeed[index];
    
    if (x[index] > width + 15) // if it reaches the right side
      x[index] = -15; // move it back to the left side
  }

  // loop to draw the 10 circles
  for (int index = 0; index <= 9; index = index + 1) {
    fill(colours[index]);
    ellipse(x[index], 50 + index * 40, 30, 30);
  }
}
