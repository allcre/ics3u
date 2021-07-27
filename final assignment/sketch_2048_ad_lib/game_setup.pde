void gameSetup() {


  // top text for the name of the game
  fill(255);
  textSize(45);
  textAlign(LEFT, TOP);
  text("2048: Ab Libitium", 20, 33);

  // boxes that show current score and high score
  currentScoreBox = new ScoreBox("current score", score);
  highScoreBox = new ScoreBox("high score", highScore);

  // drawing the game board
  // base rectangle
  fill(navy);
  rect(100, 117, 476, 476, 11);

  // placeholder rectangles
  int x = 0;
  int y = 0;

  // array that stores the placeholder tiles
  Tile[][] placeholders = new Tile[4][4];

  for (int i  = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      x = 116 + j * 114;
      y = 133 + i * 114;
      placeholders[i][j] = new Tile(x, y);
      placeholders[i][j].display();
    }
  }
}
