// declaring a new object
Ball ball1;

void setup() {
  //window size
  size(300, 300);

  // options for argument: "upwards", "downwards", "left", "right", "random"
  ball1 = new Ball("left");
}

void draw() {
  // dark background
  background(10);

  // ball methods
  ball1.display(); // draws the ball
  ball1.move(); // moves the ball
  ball1.wrap(); // brings the ball back if it travels past the window
}


// ball class
class Ball {

  // data
  PVector velocity; // velocity of the ball

  int d = 15; // diameter of the ball
  float r = d/2; // radius of the ball

  PVector position = new PVector(random(r, width - r), random(r, height - r)); // random starting position of the ball

  // constructor
  Ball(String tempDirection) {

    // initializing velocity based on the direction argument
    switch(tempDirection) {

    case "downwards":
      velocity = new PVector(0, 1); // travel downwards
      break;

    case "upwards":
      velocity = new PVector(0, -1); // travel upwards
      break;

    case "left":
      velocity = new PVector(-1, 0); // travel to the left
      break;

    case "right":
      velocity = new PVector(1, 0); // travel to the right
      break;

    default:
      velocity = new PVector(random(-5, 5), random(-5, 5)); // random direction
    }
  }

  // display method to draw the ball at its new position
  void display() {
    fill(200);
    ellipse(position.x, position.y, d, d);
  }

  // move method that adds the velocity to the location of the ball
  void move() {
    position.add(velocity);
  }

  // wrap method that returns the ball back to the window if it goes beyond the screen
  void wrap() {
    if (position.x > width + r)
      position.x = 0 - r;
    else if (position.x < 0 - r)
      position.x = width + r;

    if (position.y > height + r)
      position.y = 0 - r;
    else if (position.y < 0 - r)
      position.y = height + r;
  }
}
