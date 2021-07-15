/*
Arrays Firework
Assignment 4
Allison Cretel

For this assignment, I decided to display a list of numbers from 1 to 20 to help the user keep track of how many times they clicked,
and the number that corresponds with how many times the user has clicked changes colours to become more visible.
This was accomplished through adding an array that stores the colour of each number, and when the user clicks, the colour for that number is changed to white.
To draw the "firework", I used an array with 2 rows and 20 columns to store the x and y coordinates of each click, and then grabbed the values from the array to draw the firework.
To fill the array with the coordinates, when the user clicks, the mouseX and mouseY values are stored in the array in the corresponding click index number.
*/

// array with 2 rows and 20 columns to store 20 coordinates
int[][] coordinates = new int[2][20];

// array to store colours of the countdown numbers
color[] colours = new color[20];

// number of times the user has clicked
int clicks = 0;

void setup() {
  //window size
  size(600, 600);

  // initializes each colour in the array to a very pale and translucent pink
  for (int i = 0; i < colours.length; i++) {
    colours[i] = color(228, 203, 207, 50);
  }
}

// when mouse is clicked
void mousePressed() {

  // if 20 clicks or less have been done (counter starts at 0)
  if (clicks < 20) {
    // x and y coordinates of the click are stored in the first and second row of the array, respectively
    coordinates[0][clicks] = mouseX;
    coordinates[1][clicks] = mouseY;

    // change the colour of the click number in the array to white
    colours[clicks] = color(255);

    // add one to number of clicks
    clicks++;
  }
}

void draw() {
  // deep blue background
  background(29, 118, 122);

  // coordinates of the center of the window
  int centerX = width/2;
  int centerY = height/2;

  // text styling
  textAlign(CENTER, CENTER);
  textSize(20);

  // displays how many times the user has clicked
  // the number that corresponds with the user's click changes colour

  if (clicks < 20) { // only do this until the user has clicked 20 times (counter starts at 0)

    // coordinates for the countdown text
    int y = 233;
    int x = 212;

    // spacing for inbetween the numbers
    int spacing = 45;

    // for each number 1-20
    for (int i = 0; i < 20; i++) {

      // use the designated colour from the array
      fill(colours[i]);

      // fitting the text into 4 lines of 5 numbers
      // making a new line
      if (i % 5 == 0 && i != 0) { // if the number is a multiple of 5
        y += 35; // increase the y-coordinate by 35 px
        x -= spacing * 5; // decrease the x-coordinate by 5 times the spacing between numbers
      }

      // displays numbers from 1 to 20
      text(i + 1 + " ", x, y);
      
      // adds spacing between each number
      x += spacing;
    }
  } else { // if 20 clicks have been done

    stroke(228, 203, 207); // light pink

    fill(94, 170, 173); // light blue

    // for each coordinate in the array
    for (int i = 0; i < coordinates[0].length; i++) {

      // assign the x and y-coordinates of the click to variables
      int xClick = coordinates[0][i];
      int yClick = coordinates[1][i];

      // draw a line from the center of the window to the coordinates of the click
      line(centerX, centerY, xClick, yClick);

      // draw a circle where the click was
      ellipse(xClick, yClick, 10, 10);
    }

    fill(173, 94, 145); // fuscia
    ellipse(centerX, centerY, 25, 25); // circle in the center
  }
}
