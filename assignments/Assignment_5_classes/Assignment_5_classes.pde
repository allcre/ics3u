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
  float degrees; // how much the triangle will be rotated at the beginning (so each triangle doesn't point north to start)

  // initial position of the triangle
  float x = random(width); // random x-coordinate
  float y = random(height); // random y-coordinate 
  
  // constructor with type argument
  Triangle(String tempType) {

    type = tempType; // passing the argument to the type variable
    
    degrees = random(360); // random orientation to start rotating from
    
    // assigning variables based on the type of triangle
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
    
    // move a new coordinate plane where the origin is located at (x, y)
    pushMatrix();
    translate(x, y); 
    
    // rotate the plane by the random degrees value to start 
    rotate(radians(degrees));
    
    // draw an equilateral triangle with the origin as the center of the traingle
    triangle(0, 0 - circumradius, 
             circumradius * cos(PI/6), circumradius * sin(PI/6), 
             0 - circumradius * cos(PI/6), circumradius * sin(PI/6));
    
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
