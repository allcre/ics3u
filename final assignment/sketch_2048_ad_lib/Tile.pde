class Tile {

  int tileWidth = 101;
  color bgColour, textColour;
  int value;
  boolean alreadyMerged;
  float x, y;

  Tile(float tempX, float tempY) {
    bgColour = color(#006796);
    textColour = bgColour;
    x = tempX;
    y = tempY;
  }

  Tile (int tempValue, float tempX, float tempY) {
    value = tempValue;
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

    x = tempX;
    y = tempY;
    textColour = color(255);
  }

  void display() {
    fill(bgColour);
    rect(x, y, tileWidth, tileWidth, 5);

    // number on the tile
    textAlign(CENTER, CENTER);
    fill(textColour);
    textSize(35);
    text(value, x + tileWidth/2, y + tileWidth/2);
  }
  
  // draws a tile that is wiggling
  void wiggle() {
    pushMatrix();
    translate(x + 50.5, y + 50.5);
    
    float direction = random(1);
    if (direction < 0.5)
      rotate(radians(-5));
      else
      rotate(radians(5));
    
    fill(bgColour);
    noStroke();
    rect(-50.5, -50.5, tileWidth, tileWidth, 5);
  
    // number on the tile
    textAlign(CENTER, CENTER);
    fill(textColour);
    textSize(35);
    text(value, 0, 0);
    popMatrix();
  }
}
