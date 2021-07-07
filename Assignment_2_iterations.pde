/* 
 Creating Parabolas from Lines and a Right Angle
 Assignment 2
 Allison Cretel
 
 The approach: 
 There are 4 types of parabolas found in the drawing, each opening in a different direction. 
 Imagine a 2 x 2 grid is over the canvas, with 300 x 300 px grid squares.  
 Each type of parabola is repeated 4 times within the drawing, and the initial right angle of the parabola is always found at an intersection on the grid.  
 For loops are used to jump from point to point on the grid, and the 4 types of parabolas are drawn using the position on the grid as an anchor point.
 There are parabolas drawn that exceed the boundaries of the canvas, but these are not visible and do not noticeably affect the run time,
 so I decided it is more effecient to let these extra parabolas be drawn than to add more lines of code to stop them from being drawn. 
 
 This approach uses many less lines of code than manually determing the position of each parabola and drawing it, 
 and the use of the midpoint variable ensures that this program will work on any size canvas. 
 */

void setup() {
  size(600, 600); // canvas size
}

void draw() {
  background(252, 255, 245); // white/cream background

  int midpoint = width/2; // getting the midpoint of the length of the canvas (for the imaginary 2 x 2 grid)

  for (int y = 0; y <= height; y += midpoint) { // for each y-value on the grid, including 0, 300, and 600
    for (int x = 0; x <= width; x += midpoint) { // for each x-value on the grid, including, 0, 300, and 600
      for (int i = 0; i <= midpoint; i += 20) { // 20px interval between lines, stop drawing lines before iterations of the interval have surpassed half the width of the canvas

        if ((x != midpoint) || (y != midpoint)) // if the point on the grid is not the center one (becuase these parabolas will be a different colour)
          stroke(154, 177, 167); // teal colour
        else // if the parabolas are being drawn around the middle point
        stroke(34, 60, 73); // navy/black colour

        // drawing parabolas around the x and y-coordinates determined by the loop

        line(x + midpoint - i, y, x, y - i); // parabola that opens to the top right
        line(x + midpoint - i, y, x, y + i); // parabola that opens to the bottom right
        line(x - midpoint + i, y, x, y + i); // parabola that opens to the bottom left
        line(x - midpoint + i, y, x, y - i); // parabola that opens to the top left
      }
    }
  }
}
