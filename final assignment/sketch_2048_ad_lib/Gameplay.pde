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
  int score = 0;
  int highScore;
  boolean gameEnd;
  boolean won;

  // an array with the x and y coordinates for the top left corner of each tile position
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

  void move(String direction) {

    moved = false; // reset moved boolean

    switch (direction) {
    case "up":
      for (int i = 0; i < playingTiles.length; i++) { // traverse tiles from top to bottom
        for (int j = 0; j < playingTiles[0].length; j++) {

          if (playingTiles[i][j] != null) {
            boolean canMove = true;
            playingTiles[i][j].alreadyMerged = false; // reset the status of each tile to unmerged


            while ((canMove) && i != 0) { // i can't equal 0 because that is the top row, so no moves for those tiles are possible
              if (playingTiles[i-1][j] == null && !(playingTiles[i][j].alreadyMerged)) { // tiles can't move into a blank space once they've alreay been merged
                playingTiles[i-1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                playingTiles[i][j] = null;
                i -= 1; // to account for if the tile can move up multiple spaces
                moved = true;
              } else if (playingTiles[i-1][j].value == playingTiles[i][j].value && i != 0 // if adjacent tiles have the same value
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i-1][j].alreadyMerged)) { //if both tiles weren't already merged
                playingTiles[i-1][j] = new Tile(playingTiles[i-1][j].value * 2, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                playingTiles[i-1][j].alreadyMerged = true;
                score += playingTiles[i-1][j].value;
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
              if (playingTiles[i+1][j] == null && !(playingTiles[i][j].alreadyMerged)) { // tiles can't move into a blank space once they've alreay been merged
                playingTiles[i+1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                playingTiles[i][j] = null;
                i += 1; // to account for if the tile can move down multiple spaces
                moved = true;
              } else if (playingTiles[i+1][j].value == playingTiles[i][j].value && i != 3 
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i+1][j].alreadyMerged)) { //if both tiles weren't already merged
                playingTiles[i+1][j] = new Tile(playingTiles[i+1][j].value * 2, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                playingTiles[i+1][j].alreadyMerged = true; // keeps track if a tile was merged this round
                score += playingTiles[i+1][j].value;
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
              if (playingTiles[i][j-1] == null && !(playingTiles[i][j].alreadyMerged)) { // tiles can't move into a blank space once they've alreay been merged
                playingTiles[i][j-1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                playingTiles[i][j] = null;
                j -= 1; // to account for if the tile can move left multiple spaces
                moved = true;
              } else if (playingTiles[i][j-1].value == playingTiles[i][j].value && j != 0 
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i][j-1].alreadyMerged)) { //if both tiles weren't already merged
                playingTiles[i][j-1] = new Tile(playingTiles[i][j-1].value * 2, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                playingTiles[i][j-1].alreadyMerged = true; // keeps track that this tile has been merged this turn
                score += playingTiles[i][j-1].value;
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
              if (playingTiles[i][j+1] == null && !(playingTiles[i][j].alreadyMerged)) { // tiles can't move into a blank space once they've alreay been merged
                playingTiles[i][j+1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                playingTiles[i][j] = null;
                j += 1; // to account for if the tile can move left multiple spaces
                moved = true;
              } else if (playingTiles[i][j+1].value == playingTiles[i][j].value && j != 3 
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i][j+1].alreadyMerged)) { //if both tiles weren't already merged
                playingTiles[i][j+1] = new Tile(playingTiles[i][j+1].value * 2, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                playingTiles[i][j+1].alreadyMerged = true;
                score += playingTiles[i][j+1].value;
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
    if (score > highScore)
      highScore = score;
  }

  void shuffleTiles() {
    Tile[][] tempTiles = new Tile[playingTiles.length][playingTiles[0].length]; // temporary array to store the current tiles

    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {

        if (playingTiles[i][j] != null) {
          tempTiles[i][j] = new Tile(playingTiles[i][j].value, 0, 0); // duplicating the array
          playingTiles[i][j] = null; // erase the tile from the original array
        }
      }
    }

    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {

        if (tempTiles[i][j] != null) {

          boolean tileMade = false;
          do {
            int g = (int) random(4);
            int h = (int) random(4);

            if (playingTiles[g][h] == null && tempTiles[i][j] != null) {

              playingTiles[g][h] = new Tile(tempTiles[i][j].value, tileCoordinates[g][h][0], tileCoordinates[g][h][1]);
              tileMade = true;
            }
          } while (!(tileMade));
        }
      }
    }
    moved = false; // shuffling isn't a real game move so a tile won't be added
    score += 2000; // add shuffling bonus to score
  }



  // wiggles all the tiles to indicate that they can be rearranged
  void jiggleTiles() {

    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {
        if (playingTiles[i][j] != null) {

          playingTiles[i][j].wiggle();
        }
      }
    }
  } 


  void moveTiles() {
    if (playingTiles[originalI][originalJ] != null) {
      playingTiles[originalI][originalJ].x = mouseX - 50.5;
      playingTiles[originalI][originalJ].y = mouseY - 50.5;
    }
  }

  void reassignTiles() {

    if (playingTiles[originalI][originalJ] != null) { // if the player wasn't dragging an empty area

      if (newI == 24 || newJ == 24 || playingTiles[newI][newJ] != null) { // if the position is not on the playing board, or the spot is taken, redraw the tile in it's original spot
        playingTiles[originalI][originalJ].x = tileCoordinates[originalI][originalJ][0];
        playingTiles[originalI][originalJ].y = tileCoordinates[originalI][originalJ][1];
      } else {
        playingTiles[newI][newJ] = new Tile(playingTiles[originalI][originalJ].value, tileCoordinates[newI][newJ][0], tileCoordinates[newI][newJ][1]); // make a new tile in the new spot
        playingTiles[originalI][originalJ] = null; // erase the old tile
        score -= 1000; // 1000 score penalty for every tile that is moved
      }
    }
  }

  // returns the indexes of the position that was clicked 
  int getJ(float x) {

    for (int j = 0; j < playingTiles[0].length; j++) {

      if (x >= (tileCoordinates[0][j][0] - 6.5) && x <= (tileCoordinates[0][j][0] + 107.5)) {
        return j;
      }
    }

    return 24; // stops an error from popping up
  }

  int getI(float y) {

    for (int i = 0; i < playingTiles.length; i++) {

      if (y >= (tileCoordinates[i][0][1] - 6.5) && y <= (tileCoordinates[i][0][1] + 107.5)) {
        return i;
      }
    }

    return 24; // stops an error from popping up
  }




  // checks if game is over
  void checkEnd() {

    int tileValue = 0; // temporary variable for checks
    gameEnd = true; // default is the game ends, unless any of the checks stop it from ending

    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {
        if (playingTiles[i][j] != null) {
          tileValue = playingTiles[i][j].value;

          if (tileValue == 2048) { // if a 2048 tile is present the game ends and the player won
            gameEnd = true;
            won = true;
          } else {
            if (i != 0 && playingTiles[i-1][j] != null) { // checking if an up move is possible
              if (tileValue == playingTiles[i-1][j].value) {
                gameEnd = false;
              }
            }

            if (i != 3 && playingTiles[i+1][j] != null) { // checking if a down move is possible
              if (tileValue == playingTiles[i+1][j].value) {
                gameEnd = false;
              }
            }

            if (j != 0 && playingTiles[i][j-1] != null) { // checking if a left move is possible
              if (tileValue == playingTiles[i][j-1].value) {
                gameEnd = false;
              }
            }
            if (j != 3 && playingTiles[i][j+1] != null) { // checking if a right move is possible
              if (tileValue == playingTiles[i][j+1].value) {
                gameEnd = false;
              }
            }
          }
        } else { // shrten this 
          if (!(won)) {
            gameEnd = false;
          }
        }
      }
    }
  }

  void endScreen() {
    String msg;

    if (won)
      msg = "you won! :)";
    else 
    msg = "you lost :(";

    // drawing the square that displays the message
    noStroke();
    fill(255, 255, 255, 196.35);
    rect(100, 117, 476, 476, 11);

    // text
    textAlign(CENTER, CENTER);
    fill(navy);
    textSize(60);
    text(msg, width/2, 330);
    textSize(23);
    text("go home to play again (bottom left corner)", width/2, 400);
  }
}
