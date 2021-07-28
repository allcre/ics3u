// draws basic elements that are shown for any game mode
void gameSetup() {
  // top text for the name of the game
  fill(255);
  textSize(45);
  textAlign(LEFT, TOP);
  text("2048: Ad Libitium", 20, 33);

  // boxes that show current score and high score
  currentScoreBox = new ScoreBox("current score", board.score);
  highScoreBox = new ScoreBox("high score", board.highScore);
}
