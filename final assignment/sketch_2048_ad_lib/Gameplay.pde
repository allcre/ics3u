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
  boolean moved; // tracks if at least one tile was merged each round

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
    moved = false; // reset moved boolean

    switch (direction) {
    case "up":
      for (int i = 0; i < playingTiles.length; i++) { // traverse tiles from top to bottom
        for (int j = 0; j < playingTiles[0].length; j++) {

          if (playingTiles[i][j] != null) {
            boolean canMove = true;
            playingTiles[i][j].alreadyMerged = false; // reset the status of each tile to unmerged


            while ((canMove) && i != 0) { // i can't equal 0 because that is the top row, so no moves for those tiles are possible
              if (playingTiles[i-1][j] == null) {
                playingTiles[i-1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                playingTiles[i][j] = null;
                i -= 1; // to account for if the tile can move up multiple spaces
                moved = true;
              } else if (playingTiles[i-1][j].value == playingTiles[i][j].value && i != 0 && !(playingTiles[i][j].alreadyMerged)) { // if adjacent tiles have the same value
                playingTiles[i-1][j] = new Tile(playingTiles[i-1][j].value * 2, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                playingTiles[i-1][j].alreadyMerged = true;
                playingTiles[i][j] = null;
                i -= 1;
                moved = true;
              } else {
                canMove = false;
              }
            }
          }
        }
      }
      break;

    case "down":
      for (int i = 3; i >= 0; i--) { // traverse tiles from bottom to top
        for (int j = 0; j < playingTiles[0].length; j++) {

          if (playingTiles[i][j] != null) {
            boolean canMove = true;
            playingTiles[i][j].alreadyMerged = false; // reset the status of each tile to unmerged

            while ((canMove) && i != 3) { // i can't equal 3 because that is the bottom row, so no moves for those tiles are possible
              if (playingTiles[i+1][j] == null) {
                playingTiles[i+1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                playingTiles[i][j] = null;
                i += 1; // to account for if the tile can move down multiple spaces
                moved = true;
              } else if (playingTiles[i+1][j].value == playingTiles[i][j].value && i != 3 && !(playingTiles[i][j].alreadyMerged)) { // if adjacent tiles have the same value
                playingTiles[i+1][j] = new Tile(playingTiles[i+1][j].value * 2, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                playingTiles[i+1][j].alreadyMerged = true; // keeps track if a tile was merged this round
                playingTiles[i][j] = null;
                i += 1;
                moved = true;
              } else {
                canMove = false;
              }
            }
          }
        }
      }
      break;

    case "left":
      for (int j = 0; j < playingTiles[0].length; j++) { // traverse tiles from left to right
        for (int i = 0; i < playingTiles.length; i++) {  

          if (playingTiles[i][j] != null) {
            boolean canMove = true;
            playingTiles[i][j].alreadyMerged = false; // reset the status of each tile to unmerged

            while ((canMove) && j != 0) { // j can't equal 0 because that is the left most column, so no moves for those tiles are possible
              if (playingTiles[i][j-1] == null) {
                playingTiles[i][j-1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                playingTiles[i][j] = null;
                j -= 1; // to account for if the tile can move left multiple spaces
                moved = true;
              } else if (playingTiles[i][j-1].value == playingTiles[i][j].value && j != 0 && !(playingTiles[i][j].alreadyMerged)) { // if adjacent tiles have the same value
                playingTiles[i][j-1] = new Tile(playingTiles[i][j-1].value * 2, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                playingTiles[i][j-1].alreadyMerged = true; // keeps track that this tile has been merged this turn
                playingTiles[i][j] = null;
                j -= 1;
                moved = true;
              } else {
                canMove = false;
              }
            }
          }
        }
      }
      break;

    case "right": // could switch to default maybe
      for (int j = 3; j >= 0; j--) { // traverse tiles from right to left
        for (int i = 0; i < playingTiles.length; i++) {  

          if (playingTiles[i][j] != null) {
            boolean canMove = true;
            playingTiles[i][j].alreadyMerged = false; // reset the status of each tile to unmerged

            while ((canMove) && j != 3) { // j can't equal 3 because that is the right most column, so no moves for those tiles are possible
              if (playingTiles[i][j+1] == null) {
                playingTiles[i][j+1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                playingTiles[i][j] = null;
                j += 1; // to account for if the tile can move left multiple spaces
                moved = true;
              } else if (playingTiles[i][j+1].value == playingTiles[i][j].value && j != 3 && !(playingTiles[i][j].alreadyMerged)) { // if adjacent tiles have the same value
                playingTiles[i][j+1] = new Tile(playingTiles[i][j+1].value * 2, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                playingTiles[i][j+1].alreadyMerged = true;
                playingTiles[i][j] = null;
                j += 1;
                moved = true;
              } else {
                canMove = false;
              }
            }
          }
        }
      }
      break;
    }
  }

  void checkEnd() {
  }
} 
