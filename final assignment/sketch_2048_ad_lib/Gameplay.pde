boolean boardMade;

class Gameplay {

  // array with all tiles
  Tile[][] playingTiles;

  // array that stores the placeholder tiles
  Tile[][] placeholders;

  int value;
  int i = 0;
  int j = 0;
  String direction; // direction of move

  // populating the tile coordinates array with the x and y coordinates for the top left corner of each tile position
  int[][][] tileCoordinates;


  Gameplay() {
    playingTiles = new Tile[4][4];
    placeholders = new Tile[4][4];
  }

  // draws the plain board
  void plainBoard() {
    // drawing the game board
    // base rectangle
    fill(navy);
    noStroke();
    rect(100, 117, 476, 476, 11);

    tileCoordinates = new int[4][4][2];

    // placeholder rectangles and populating tile coordinates array
    for (int i  = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tileCoordinates[i][j][0] = 116 + j * 114;
        tileCoordinates[i][j][1] = 133 + i * 114;
        placeholders[i][j] = new Tile(tileCoordinates[i][j][0], tileCoordinates[i][j][1]);
        placeholders[i][j].display();
      }
    }
  }

  // adding a new random tile into gameplay
  void newTile() {
    boolean tileMade = false;
    do {
      i = (int) random(4);
      j = (int) random(4);

      float randomValue = random(1);

      if (playingTiles[i][j] == null) {
        if (randomValue < 0.9)
          value = 2;
        else
          value = 4;

        playingTiles[i][j] = new Tile(value, tileCoordinates[i][j][0], tileCoordinates[i][j][1]);
        tileMade = true;
      }
    } while (!(tileMade));
  }

  void showTiles() {
    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {
        if (playingTiles[i][j] != null) {
          playingTiles[i][j].display();
        }
      }
    }
  }

  void move(String tempDirection) {
    direction = tempDirection; // this might be unneccessary

    switch (direction) {
    case "up":

      break;

    case "down":

      break;

    case "left":

      break;

    case "right": // could switch to default maybe

      break;
    }
  }
} 
