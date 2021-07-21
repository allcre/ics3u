/*
Triangle Class with Parallax
Assignment 5
Allison Cretel

For this assignment, I implented the use of pushMatrix() and popMatrix() to rotate the triangles around their centers, since the origin of the triangle is located at
the origin of the plane. The plane is then rotated with the rotate() function, and the triangle is redrawn around the origin. To ensure the triangle is an equilateral triangle
and it rotates around its center, I used trigonometric functions and a circumradius measurement so that an equilateral triangle can be drawn with any point as its centroid. 

In the Triangle constructor, depending on which type is passed through the argument, variables for the traingles' size, speed, colour, etc. are appropriately assigned,
and these variables are used in the class' methods.

I created two methods in the Triangle function, rotateTrig() and moveDown(). Having two methods organises the code and makes it easier to debug, 
and there's not an unnecessarily large number of functions to call in the draw function. 
 */

// array of objects to store all triangles
Triangle[][] triangles;

void setup() {
  // window size
  size(900, 600);

  // 2d array with 3 rows and 20 columns, each row is for a type of triangle (background, midground, or foreground)
  triangles = new Triangle[3][20];

  // nested for loops to assign each triangle its respective type depending on which row it's in
  for (int i = 0; i < triangles.length; i++) { // for each row
    for (int j = 0; j < triangles[0].length; j++) { // for each column

      switch(i) {

        // if in the first row, create a background triangle
      case 0:
        triangles[i][j] = new Triangle("background");
        break;

        // if in the second row, create a midground triangle
      case 1:
        triangles[i][j] = new Triangle("midground");
        break;

        // if in the last row, create a forground triangle
      default:
        triangles[i][j] = new Triangle("foreground");
      }
    }
  }
}

void draw() {
  background(#003049); // navy blue background

  // for each triangle, apply the rotate and move methods
  for (int i = 0; i < triangles.length; i++) {
    for (int j = 0; j < triangles[0].length; j++) {
      triangles[i][j].rotateTrig();
      triangles[i][j].moveDown();
    }
  }
}


// triangle class
class Triangle {

  // data
  String type; // background, midground, or foreground
  color colour; // colour of the triangle
  float circumradius; // circumradius of the triangle (distance from the center of an equilateral triangle to a vertex)
  int fallSpeed; // falling speed of the triangle
  int rotateSpeed; // rotation speed of the triangle

  float degrees = random(120); // random orientation to start rotating at (in degrees)

  // initial position of the triangle
  float x = random(width); // random x-coordinate
  float y = random(height); // random y-coordinate

  // constructor with type argument
  Triangle(String tempType) {

    type = tempType; // passing the argument to the type variable

    // initializing variables based on the type of triangle
    switch(type) {

      // if a background triangle, assign slow speeds and a small size
    case "background":
      colour = color(#d62828); // red
      circumradius = random(10, 25);
      fallSpeed = 1;
      rotateSpeed = 1;
      break;

      // if a midground triangle, assign faster speeds and a medium size
    case "midground":
      colour = color(#f77f00); // orange
      circumradius = random(20, 35);
      fallSpeed = 2;
      rotateSpeed = 2;
      break;

      // if a foreground triangle, assign even faster speeds and a large size
    default:
      colour = color(#fcbf49); // yellow
      circumradius = random(30, 45);
      rotateSpeed = 3;
      fallSpeed = 3;
    }
  }

  // draw and rotate function
  void rotateTrig() {
    noStroke(); // no outline
    fill(colour); // fill with the appropriate colour

    // "make" a new coordinate plane where the origin is located at (x, y), the center of the triangle
    pushMatrix();
    translate(x, y);

    // rotate the plane by the degrees value
    rotate(radians(degrees));

    // draw an equilateral triangle with the origin as the center of the triangle
    triangle(0, 0 - circumradius, 
      circumradius * cos(PI/6), circumradius * 0.5, // 0.5 = sin(PI/6)
      0 - circumradius * cos(PI/6), circumradius * 0.5);

    // add the rotation speed to the degrees variable
    degrees += rotateSpeed;

    // restore the previous coordinate system
    popMatrix();
  }

  // function that moves the triangles down
  void moveDown() {

    // if the y value is less than the height plus the circumradius add the fall speed to the y value
    if (y < height + circumradius)
      y += fallSpeed;

    // if the triangle is no longer visible, change the y value so the triangle is just past the top edge of the window
    else
      y = 0 - circumradius;
  }
}
