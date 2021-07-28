// tile object
class Tile {

  // data
  int tileWidth = 101; // size
  color bgColour, textColour; // colour of the tile and its text
  int value; // value of the tile in the gme
  boolean alreadyMerged; // tracks if a tile is a product of two merged tiles
  float x, y; // position of the tile

  // constructor for placeholder tiles with no value
  Tile(float tempX, float tempY) {
    bgColour = color(#006796); // medium blue
    textColour = bgColour; // same text colour as background colour so text is hidden
    // passing arguments
    x = tempX;
    y = tempY;
  }

  // constructor for playing tiles
  Tile (int tempValue, float tempX, float tempY) {
    // passing arguments
    value = tempValue;
    x = tempX;
    y = tempY;

    // tile colours based on value
    switch (value) {
    case 2:
      bgColour = color(#EFDDA9); // yellow
      break;
    case 4:
      bgColour = color(#D9BCA3); // beige
      break;
    case 8:
      bgColour = color(#BF8892); // rose pink
      break;
    case 16:
      bgColour = color(#532740); // fuscia
      break;
    case 32:
      bgColour = color(#734C48); // brown
      break;
    case 64:
      bgColour = color(#126369); // deep green
      break;
    default:
      bgColour = color(#759FBC); // light blue
    }

    textColour = color(255); // white text
  }

  // draw a tile
  void display() {
    fill(bgColour); // colour
    noStroke();
    rect(x, y, tileWidth, tileWidth, 5);

    // centered number on the tile
    textAlign(CENTER, CENTER);
    fill(textColour);
    textSize(43);
    text(value, x + tileWidth/2, y + tileWidth/2);
  }

  // draw a wiggling tile
  void wiggle() {
    pushMatrix(); // new plane
    translate(x + 50.5, y + 50.5); // move plane to the center of the tile

    // rotate either backwards or forwards by 5 degrees
    float direction = random(1);
    if (direction < 0.5)
      rotate(radians(-5));
    else
      rotate(radians(5));

    fill(bgColour); // colour
    noStroke();
    rect(-50.5, -50.5, tileWidth, tileWidth, 5);

    // number on the tile
    textAlign(CENTER, CENTER);
    fill(textColour);
    textSize(43);
    text(value, 0, 0); // centered text
    popMatrix(); // put the plane back
  }
}
