int bounceRad = 60;  // radius of the bouncing ball
int mouseRad = 15;   // radius of the ball that follows the mouse

float xpos, ypos;    // position of the bouncing ball    

float xspeed = 2.8;  // speed of the bouncing ball (how many pixels travelled left or right)
float yspeed = 2.2;  // speed of the bouncing ball (how many pixels travelled up or down)

int xdirection = 1;  // left or right
int ydirection = 1;  // top to bottom

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
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(102); // grey background

  // test to see if the distance between the centers of both circles is less than their combined radii (this would mean they're colliding)
  // if yes, change the colour to blue, decrease the bouncing ball's radius, and increase the speed
  if (dist(mouseX, mouseY, xpos, ypos) < mouseRad + bounceRad) {
    fill(0, 0, 255);
    bounceRad -= 1;
    xspeed += 0.5;
    yspeed += 0.5;
  }

  // update the position of the bouncing ball
  xpos += xspeed * xdirection;
  ypos += yspeed * ydirection;

  // test to see if the bouncing ball exceeds the boundaries of the screen
  // if it does, reverse its direction by multiplying by -1
  if (xpos > width - bounceRad || xpos < bounceRad)
    xdirection *= -1;

  if (ypos > height - bounceRad || ypos < bounceRad) 
    ydirection *= -1;


  // draw the shape of the bouncing ball
  ellipse(xpos, ypos, bounceRad, bounceRad);

  // small white circle that follows the mouse
  fill(255); // colours future shapes white
  ellipse(mouseX, mouseY, mouseRad, mouseRad);
}
