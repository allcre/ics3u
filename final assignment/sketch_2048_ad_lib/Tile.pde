class Tile {

  int tileWidth = 101;
  color bgColour, textColour;
  int value;
  int x, y;

  Tile(int tempX, int tempY) {
    bgColour = color(#006796);
    textColour = bgColour;
    x = tempX;
    y = tempY;
  }

  Tile (int tempValue, int tempX, int tempY) {
    value = tempValue;
     // FILL OUT COLOURS DEPENDING ON VALUE
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
    textSize(30);
    text(value, x + tileWidth/2, y + tileWidth/2);
  }
}
