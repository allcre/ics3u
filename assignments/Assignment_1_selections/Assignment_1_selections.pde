/*
Concentric Circles
Assignment 1
Allison Cretel

The concept:
Firstly, the distance from the center of the canvas to the cursor is calculated, and depending on the distance, a circle will be coloured.
The cursor's distance from the center is compared to the radii of the circles (radii are also the distances from the centre of the canvas to the edge of the circle),
and if statements are used to ensure circles are only coloured when the cursor is over the visible area.
The same principle applies for the shapes that follow the cursor.
*/


int x, y; // these will be the coordinates for the centre of the window
float distance; // this will be the distance from the centre to the cursor

// diameters of the circles
int d1 = 600;
int d2 = 400;
int d3 = 200;

// radii of the circles (diameter divided by 2)
int r1 = d1/2;
int r2 = d2/2;
int r3 = d3/2;

void setup() {
  size(660, 660);
  x = width/2; // calculating the coordinates of the middle of the window
  y = height/2;
}

void draw() {
  background(255); // white background
  distance = dist(mouseX, mouseY, x, y); // the distance between the x and y coordinates of the mouse and the centre of the window
  fill(255); // fill the following shapes white

  if (distance <= r1 && distance > r2) { // if the cursor is between 300 and 200 px away from the center (this is the visible area of the largest circle)
    fill(255, 0, 0); // colour red
    ellipse(x, y, d1, d1); // circle with 600 px diameter at the centre of the window
  } else { // if not inside the visible area of the largest circle
    ellipse(x, y, d1, d1); // plain white circle
  }

  if (distance <= r2 && distance > r3) { // if the cursor is in the visible area of the middle circle (between 200 and 100 px away from the center)
    fill(0, 255, 0); // colour green
    ellipse(x, y, d2, d2); // middle circle
  } else { // if not inside the visible area of the middle circle
    fill(255); // colour white
    ellipse(x, y, d2, d2); // plain white middle circle
  }

  if (distance <= r3) { // if the cursor is 100px away from the center or less
    fill(255, 255, 0); // colour yellow
    ellipse(x, y, d3, d3); // 200px diameter centered yellow circle
  } else { // if not within 100px from the centre
    fill(255); // colour white
    ellipse(x, y, d3, d3); // small centered circle
  }

  // the shapes following the cursor
  // I didn't include these in the same conditional statements as the circles so the shapes would always be drawn on top of the circles (and there are less fill statements)

  if (distance <= r3) { // if within the radius of the smallest circle
    line(mouseX - 10, mouseY, mouseX + 10, mouseY); // horizontal line of the crosshair; the midpoint of the line has the same coordinates as the cursor
    line(mouseX, mouseY - 10, mouseX, mouseY + 10); // vertical line of the crosshair; perpendicular to the horizontal line and intersects through the middle
  } else if (distance <= r2) { // if within the radius of the middle circle
    rect(mouseX - 10, mouseY - 10, 20, 20); // 20px square, with the center of the square having the same coordinates as the cursor (-10 in the x and y coordinates adjusts for this)
  } else if (distance <= r1) { // if within the radius of the largest circle
    ellipse(mouseX, mouseY, 20, 20); // 20px circle with the same coordinates as the mouse (to follow the cursor around)
  }
}
