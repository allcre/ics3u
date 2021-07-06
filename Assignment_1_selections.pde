int x, y; // these will be the coordinates for the centre of the window
float distance; // this will be the distance from the centre to the cursor

void setup() {
  size(660, 660);
  x = width/2; // calucating the coordinates of the middle of the window
  y = height/2;
}

void draw() {
  background(255); // white background
  distance = dist(mouseX, mouseY, x, y); // the distance between the x and y coordinates of the mouse and the centre of the window
  fill(255); // fill the following shapes white

  if (distance <= 300 && distance > 200) { // if the cursor is between 300 and 200 px away from the center (this is the visible area of the largest circle)
    fill(255, 0, 0); // colour red
    ellipse(x, y, 600, 600); // circle with 600 px diameter at the centre of the window

    fill(255); // colour white
    ellipse(mouseX, mouseY, 20, 20); // 20px circle with the same coordinates as the mouse (to follow the cursor around)
  
} else { // if not inside the visible area of the largest circle
    ellipse(x, y, 600, 600); // plain white circle
  }

  if (distance <= 200 && distance > 100) { // if the cursor is in the visible area of the middle circle (between 200 and 100 px away from the center)
    fill(0, 255, 0); // colour green
    ellipse(x, y, 400, 400); // green centered middle circle 
    
    fill(255); // colour white
    rect(mouseX - 10, mouseY - 10, 20, 20); // 20px square, with the center of the square having the same coordinates as the cursor (-10 in the x and y coordinates adjusts for this)
  
} else { // if not inside the visible area of the middle circle
    fill(255); // colour white
    ellipse(x, y, 400, 400); // plain white middle circle
  }

  if (distance <= 100) { // if the cursor is less than or 100px away from the center 
    fill(255, 255, 0); // colour yellow
    ellipse(x, y, 200, 200); // 200px diameter centered yellow circle
    
    line(mouseX - 10, mouseY, mouseX + 10, mouseY); // horizontal line of the crosshair; the midpoint of the line has the same coordinates as the cursor
    line(mouseX, mouseY - 10, mouseX, mouseY + 10); // vertical line of the crosshair; perpendicular to the horizontal line and intersects through the middle
  
} else { // if not within 100px from the centre
    fill(255); // colour white
    ellipse(x, y, 200, 200); // small centered circle
  }
}
