/*
 Creating Parabolas from Lines and a Right Angle
 Assignment 2
 Allison Cretel

 The approach:
 There are 4 types of parabolas found in the drawing, each opening in a different direction.
 Imagine a 2 x 2 grid is over the canvas, with 300 x 300 px grid squares.
 Each type of parabola is repeated 4 times within the drawing, and the initial right angle of the parabola is always found at an intersection on the grid.
 For loops are used to jump from point to point on the grid, and the respective types of parabolas are drawn using the position on the grid as an anchor point.

 This approach uses many less lines of code than manually determining the position of each parabola and drawing it,
 and the use of the midpoint and width/height variables ensure that this program will work on any size canvas.

 I could have drawn 4 parabolas from every point on the canvas, and the output would have looked the same, but I decided I did not want extra parabolas being drawn off the canvas
 and potentially slowing the runtime of the program if it were scaled.
 */

void setup() {
  size(600, 600); // canvas size
}

void draw() {
  background(252, 255, 245); // white/cream background

  int midpoint = width/2; // getting the midpoint of the length of the canvas (for the imaginary 2 x 2 grid)

  for (int y = 0; y <= height; y += midpoint) { // for each y-value on the grid, including 0, 300, and 600
    for (int x = 0; x <= width; x += midpoint) { // for each x-value on the grid, including 0, 300, and 600
      for (int i = 0; i <= midpoint; i += 20) { // 20px interval between lines, stop drawing lines before iterations of the interval have surpassed half the width of the canvas

        if ((x != midpoint) || (y != midpoint)) // if the point on the grid is not the center one (because these parabolas will be a different colour)
          stroke(154, 177, 167); // teal colour
        else // if the parabolas are being drawn around the middle point
        stroke(34, 60, 73); // navy/black colour

        // drawing parabolas around the x and y-coordinates determined by the loop
        // if statements stop unnecessary parabolas from being drawn off the canvas

        // if not at the bottom left corner
        if (y != height && x != 0)
          line(x - midpoint + i, y, x, y + i); // parabola that opens to the bottom left

        // if not at the bottom right corner
        if (x != height && x != width)
          line(x + midpoint - i, y, x, y + i); // parabola that opens to the bottom right

        // if not at the top left corner
        if (y != 0 && x != 0)
          line(x - midpoint + i, y, x, y - i); // parabola that opens to the top left

        // if not at the top right corner
        if (y!= 0 && x != width)
          line(x + midpoint - i, y, x, y - i); // parabola that opens to the top right
      }
    }
  }
}
