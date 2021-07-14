/*
Circular Collision Detection
Assignment 3
Allison Cretel
 
The program checks if the distance between the center of the bouncing ball and the center of the player's ball is less than the combined radiuses of both balls,
because this means that they are colliding. If the condition is met, the radius of the ball decreases and the speed increases.
The program also checks if the radius of the bouncing ball is less or equal to 0, becuase then the game is over (which means the player's ball is no longer drawn) and a winning message is displayed. 
This also prevents the bouncing ball from reappearing, becuase once the radius becomes negative and continues to shrink, the ball grows larger (I have no clue why this happens)
*/

int bounceRad = 60;  // radius of the bouncing ball
int mouseRad = 15;   // radius of the ball that follows the mouse

float xPos, yPos;    // position of the bouncing ball    

float xSpeed = 2.8;  // speed of the bouncing ball (how many pixels travelled left or right)
float ySpeed = 2.2;  // speed of the bouncing ball (how many pixels travelled up or down)

int xDirection = 1;  // left or right
int yDirection = 1;  // top to bottom

void setup() {
  // window size
  size(640, 360);

  // no outline on shapes
  noStroke();

  // frames per second
  frameRate(30);

  // third and fourth parameters of ellipse() specify half of the width and height of the shape
  ellipseMode(RADIUS);

  // set the starting position of the shape
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  background(102); // grey background

  // test to see if the distance between the centers of both circles is less than their combined radii (this would mean they're colliding)
  // if yes, change the colour to blue, decrease the bouncing ball's radius, and increase the speed
  if (dist(mouseX, mouseY, xPos, yPos) < mouseRad + bounceRad) {
    fill(0, 0, 255);
    bounceRad -= 1;
    xSpeed += 0.5;
    ySpeed += 0.5;
  }

  // update the position of the bouncing ball
  xPos += xSpeed * xDirection;
  yPos += ySpeed * yDirection;

  // test to see if the bouncing ball exceeds the boundaries of the screen
  // if it does, reverse its direction by multiplying by -1
  if (xPos > width - bounceRad || xPos < bounceRad)
    xDirection *= -1;

  if (yPos > height - bounceRad || yPos < bounceRad) 
    yDirection *= -1;

  // draw the shape of the bouncing ball
  ellipse(xPos, yPos, bounceRad, bounceRad);

  // if radius of the bouncing ball is less than or equal to zero display winning message
  if (bounceRad <= 0) {
    textSize(50);
    textAlign(CENTER, CENTER);
    text("You won!", 320, 160);
  } 
  // if the bouncing ball is still visible continue drawing the small white ball that follows the cursor
  else {
    fill(255);
    ellipse(mouseX, mouseY, mouseRad, mouseRad);
  }
}
