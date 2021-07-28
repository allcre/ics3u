// Gameplay object, includes all tiles in play and the board they're drawn on
class Gameplay {

  // data

  Tile[][] playingTiles; // array with all playing tiles
  Tile[][] placeholders; // array that stores the placeholder tiles
  int[][][] tileCoordinates; // an array with the x and y coordinates of the top left corner of each possible tile position
  int value; // value of a tile
  int i = 0; //indexes
  int j = 0;

  String direction; // direction of move
  boolean moved; // tracks if at least one tile was merged each round
  int score = 0; // score is 0 to start
  int highScore; // high score
  boolean gameEnd; // is the game over
  boolean won; // is the game won

  // constructor
  Gameplay() {
    // initialize arrays
    playingTiles = new Tile[4][4];
    placeholders = new Tile[4][4];
    tileCoordinates = new int[4][4][2];
  }

  // draws a plain board
  void plainBoard() {
    // base rectangle
    fill(navy);
    noStroke();
    rect(100, 117, 476, 476, 11);

    // drawing placeholder rectangles and populating the tile coordinates array
    for (int i  = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tileCoordinates[i][j][0] = 116 + j * 114;
        tileCoordinates[i][j][1] = 133 + i * 114;
        placeholders[i][j] = new Tile(tileCoordinates[i][j][0], tileCoordinates[i][j][1]);
        placeholders[i][j].display(); // show tiles
      }
    }
  }

  // adding a new random tile into gameplay
  void newTile() {
    boolean tileMade = false; // at first, a tile hasn't been made

    // repeat until a tile has been made
    do {
      // random values 0-3
      i = (int) random(4);
      j = (int) random(4);

      // random value 0-1 to decide if the tile will be a 2 or a 4
      float randomValue = random(1);

      if (playingTiles[i][j] == null) { // if the spot is empty
        // assign value (90% chance of being a 2 and a 10% chance of being a 4)
        if (randomValue < 0.9)
          value = 2;
        else
          value = 4;

        // make a new tile at the coordinates that correspond with the indexes
        playingTiles[i][j] = new Tile(value, tileCoordinates[i][j][0], tileCoordinates[i][j][1]);
        tileMade = true; // a tile was succesfully made
      }
    } while (!(tileMade));
  }

  // draws all tiles
  void showTiles() {
    for (int i = 0; i < playingTiles.length; i++) { // for each row
      for (int j = 0; j < playingTiles[0].length; j++) { // for each column

        if (playingTiles[i][j] != null) { // if there is a tile
          playingTiles[i][j].display(); // call display function
          playingTiles[i][j].alreadyMerged = false; // reset merged status to false
        }
      }
    }
  }

  // moves and merges all tiles according to the direction argument
  void move(String direction) {

    moved = false; // reset moved boolean

    switch (direction) { // for the different cases of direction

      // moving up
    case "up":

      // traverse tiles from top to bottom, left to right
      for (int i = 0; i < playingTiles.length; i++) {
        for (int j = 0; j < playingTiles[0].length; j++) {

          if (playingTiles[i][j] != null) { // if the spot is not empty

            boolean canMove = true; // a tile has a move

            // while a tile has a move and the tile is not located at the top of the board, because those tiles have no moves
            while ((canMove) && i != 0) {

              // if the spot above the tile is empty
              if (playingTiles[i-1][j] == null) {
                // make a new tile in the spot above with the same value and appropriate coordinates
                playingTiles[i-1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                // erase the old tile
                playingTiles[i][j] = null;
                i -= 1; // to account for if the tile can move up multiple spaces
                moved = true; // a move has been made
              }

              // if vertically adjacent tiles have the same value and the tile is not at the top of the board
              else if (playingTiles[i-1][j].value == playingTiles[i][j].value && i != 0
                // and if both tiles weren't already merged
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i-1][j].alreadyMerged)) {

                // make a new tile in the spot of the higher adjacent tile that has the combined value of the merged tiles
                playingTiles[i-1][j] = new Tile(playingTiles[i-1][j].value * 2, tileCoordinates[i-1][j][0], tileCoordinates[i-1][j][1]);
                playingTiles[i-1][j].alreadyMerged = true; // tile has been merged
                score += playingTiles[i-1][j].value; // add the value of the new tile to the score
                playingTiles[i][j] = null; // erase the tile that was merged
                i -= 1; // accounts for if the tile can move up
                moved = true; // a move has been made
              } else // otherwise the tile has no moves
              canMove = false;
            }
          }
        }
      }
      break;

      /* each of the following cases for the other directions are similar to the up case and follow the same format
       the differences are:
       - the order the tiles are traversed
       - which spot gets checked if its empty
       - which spot a merged tile is made in
       */

      // moving down
    case "down":

      // traverse tiles from bottom to top, left to right
      for (int i = 3; i >= 0; i--) {
        for (int j = 0; j < playingTiles[0].length; j++) {

          if (playingTiles[i][j] != null) { // if the spot is not empty

            boolean canMove = true; // a tile has a move

            // while the tile can move and the tile is not on the bottom row (because no moves are possible for tiles on the bottom)
            while ((canMove) && i != 3) {

              // if the spot below the tile is empty
              if (playingTiles[i+1][j] == null) {
                // make a new tile in the spot below with the same value and the current tile
                playingTiles[i+1][j] = new Tile(playingTiles[i][j].value, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                // erase the old tile
                playingTiles[i][j] = null;
                i += 1; // to account for if the tile can move down multiple spaces
                moved = true; // a move has been made
              }

              // if vertically adjacent tiles have the same value and the current tile is not at the bottom of the board
              else if (playingTiles[i+1][j].value == playingTiles[i][j].value && i != 3
                // and if both tiles have not been merged already
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i+1][j].alreadyMerged)) { //if both tiles weren't already merged

                // make a new tile in the spot below with the combined value of the merged tiles
                playingTiles[i+1][j] = new Tile(playingTiles[i+1][j].value * 2, tileCoordinates[i+1][j][0], tileCoordinates[i+1][j][1]);
                playingTiles[i+1][j].alreadyMerged = true; // tile has been merged
                score += playingTiles[i+1][j].value; // update score
                playingTiles[i][j] = null; // erase one tile
                i += 1; // check if the same tile can move down more
                moved = true; // move has been made
              } else { // otherwise the tile can't move
                canMove = false;
              }
            }
          }
        }
      }
      break;

      // moving to the left
    case "left":

      // traverse tiles left to right, top to bottom
      for (int j = 0; j < playingTiles[0].length; j++) {
        for (int i = 0; i < playingTiles.length; i++) {

          if (playingTiles[i][j] != null) { // if the spot has a tile
            boolean canMove = true; // check for moves

            // while moves are possible and the tile is not on the left edge of the board
            while ((canMove) && j != 0) {

              // if the spot to the left is empty
              if (playingTiles[i][j-1] == null) {
                // duplicate the tile into that spot
                playingTiles[i][j-1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                // erase old tile
                playingTiles[i][j] = null;
                j -= 1; // check if the new tile can move
                moved = true; // move made
              }

              // if horizontally adjacent tiles have the same value and both weren't already merged
              else if (playingTiles[i][j-1].value == playingTiles[i][j].value && j != 0
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i][j-1].alreadyMerged)) {

                // new tile with their combined value
                playingTiles[i][j-1] = new Tile(playingTiles[i][j-1].value * 2, tileCoordinates[i][j-1][0], tileCoordinates[i][j-1][1]);
                playingTiles[i][j-1].alreadyMerged = true; // merged tile
                score += playingTiles[i][j-1].value; // update score
                playingTiles[i][j] = null; // erase one tile
                j -= 1; // check if the new tile can move
                moved = true; // move made
              } else // otherwise no moves possible
              canMove = false;
            }
          }
        }
      }
      break;

      // moving right
    case "right":

      // traverse tiles right to left, top to bottom
      for (int j = 3; j >= 0; j--) {
        for (int i = 0; i < playingTiles.length; i++) {

          if (playingTiles[i][j] != null) { // if there's a tile
            boolean canMove = true; // check for moves

            // while moves are possible and not a right-edge tile
            while ((canMove) && j != 3) {

              // if there's an empty spot to the right
              if (playingTiles[i][j+1] == null) {
                // duplicate tile in the spot
                playingTiles[i][j+1] = new Tile(playingTiles[i][j].value, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                // erase the old
                playingTiles[i][j] = null;
                j += 1; // check if tile can move more
                moved = true; // a move was made
              }

              // if horzontally adjacent tiles have the same value and neither has been merged this turn
              else if (playingTiles[i][j+1].value == playingTiles[i][j].value && j != 3
                && !(playingTiles[i][j].alreadyMerged) && !(playingTiles[i][j+1].alreadyMerged)) {

                // new tile with their combined value
                playingTiles[i][j+1] = new Tile(playingTiles[i][j+1].value * 2, tileCoordinates[i][j+1][0], tileCoordinates[i][j+1][1]);
                playingTiles[i][j+1].alreadyMerged = true; // merged
                score += playingTiles[i][j+1].value; // update score
                playingTiles[i][j] = null; // erase one tile
                j += 1; // check for moves
                moved = true; // move was made
              } else // otherwise no moves possible
              canMove = false;
            }
          }
        }
      }
      break;
    }

    // update high score
    if (score > highScore)
      highScore = score;
  }

  // shuffles all tiles on the board
  void shuffleTiles() {
    Tile[][] tempTiles = new Tile[playingTiles.length][playingTiles[0].length]; // temporary array to store the current tiles

    // for each spot on the board
    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {

        // if there is a tile
        if (playingTiles[i][j] != null) {
          // duplicate the tile into the temporary array and erase it from the board
          tempTiles[i][j] = new Tile(playingTiles[i][j].value, 0, 0);
          playingTiles[i][j] = null;
        }
      }
    }

    // for each spot in the temporary array
    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {

        if (tempTiles[i][j] != null) { // if there is a tile

          boolean tileMade = false; // tracks if a tile has been made

          // until a tile has been made
          do {
            // randomly generate indexes
            int g = (int) random(4);
            int h = (int) random(4);

            // if there is an empty spot on the board at the randomly generated spot
            if (playingTiles[g][h] == null) {
              // duplicate the tile from the temp array there
              playingTiles[g][h] = new Tile(tempTiles[i][j].value, tileCoordinates[g][h][0], tileCoordinates[g][h][1]);
              tileMade = true; // a tile has been made
            }
          } while (!(tileMade));
        }
      }
    }
    moved = false; // shuffling doesn't count as a valid move
    score += 500; // add shuffling bonus to score
  }

  // wiggles all the tiles to indicate that they can be rearranged
  void jiggleTiles() {

    // for each playing tile
    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {
        if (playingTiles[i][j] != null)
          playingTiles[i][j].wiggle(); // run the wiggle method
      }
    }
  }

  // returns the column index of an x-coordinate
  int getJ(float x) {
    // for each column
    for (int j = 0; j < playingTiles[0].length; j++) {
      // if x is inbetween the x-coordinates of the left and right side of the column
      if (x >= (tileCoordinates[0][j][0] - 6.5) && x <= (tileCoordinates[0][j][0] + 107.5)) // 6.5 accounts for gaps between tiles
        return j; // return the column index
    }

    // if not within a column, return 24 (random number)
    return 24;
  }

  // returns the row index of a y-coordinate
  int getI(float y) {
    // for each row
    for (int i = 0; i < playingTiles.length; i++) {
      // if y is inbetween the y-coordinates of the top and bottom of each row
      if (y >= (tileCoordinates[i][0][1] - 6.5) && y <= (tileCoordinates[i][0][1] + 107.5)) // 6.5 accounts for gaps between tiles
        return i; // return the row index
    }

    // if not within a row, return 24
    return 24;
  }

  // method to manually drag and move a tile
  void moveTiles() {
    if (playingTiles[originalI][originalJ] != null) { // if a tile was picked up
      // change the tiles x and y values to the players mouse coordinates minus half of the tile width (so the cursor is centered in the tile)
      playingTiles[originalI][originalJ].x = mouseX - 50.5;
      playingTiles[originalI][originalJ].y = mouseY - 50.5;
    }
  }

  // reassigns the index values of a playing tile after it's been moved
  void reassignTiles() {

    if (playingTiles[originalI][originalJ] != null) { // if the player wasn't dragging an empty area

      // if the new position is not on the playing board, or the spot is taken, change x and y of the tile to its original spot
      if (newI == 24 || newJ == 24 || playingTiles[newI][newJ] != null) {
        playingTiles[originalI][originalJ].x = tileCoordinates[originalI][originalJ][0];
        playingTiles[originalI][originalJ].y = tileCoordinates[originalI][originalJ][1];
      }

      // otherwise make a new tile in the new spot
      else {
        playingTiles[newI][newJ] = new Tile(playingTiles[originalI][originalJ].value, tileCoordinates[newI][newJ][0], tileCoordinates[newI][newJ][1]);
        playingTiles[originalI][originalJ] = null; // erase the old tile
        score -= 250; // point penalty for every tile that is moved
      }
    }
  }

  // checks if the game is over
  void checkEnd() {

    int tileValue = 0; // temporary variable for checks
    gameEnd = true; // default is the game ends, unless any of the checks stop it from ending

    // for each spot on the board
    for (int i = 0; i < playingTiles.length; i++) {
      for (int j = 0; j < playingTiles[0].length; j++) {
        if (playingTiles[i][j] != null) { // if there is a tile
          tileValue = playingTiles[i][j].value; // for readability

          if (tileValue == 2048) { // if a 2048 tile is present the game ends and the player won
            gameEnd = true;
            won = true;
            score += 50000; // 50k point bonus for making a 2048 tile
          } else { // otherwise check if any moves can be made

            if (i != 0 && playingTiles[i-1][j] != null) { // checking if an up move is possible
              if (tileValue == playingTiles[i-1][j].value)
                gameEnd = false;
            }

            if (i != 3 && playingTiles[i+1][j] != null) { // checking if a down move is possible
              if (tileValue == playingTiles[i+1][j].value)
                gameEnd = false;
            }

            if (j != 0 && playingTiles[i][j-1] != null) { // checking if a left move is possible
              if (tileValue == playingTiles[i][j-1].value) 
                gameEnd = false;
            }

            if (j != 3 && playingTiles[i][j+1] != null) { // checking if a right move is possible
              if (tileValue == playingTiles[i][j+1].value)
                gameEnd = false;
            }
          }
        }

        // if there is an empty spot and the game hasn't been won, the game doesn't end
        else if (!(won))
          gameEnd = false;
      }
    }
  }

  // displays the won/lost screen
  void endScreen() {
    String msg;

    // assign msg depending on if the player won or lost
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
