void gameSetup() {

  // top text for the name of the game
  fill(255);
  textSize(45);
  textAlign(LEFT, TOP);
  text("2048: Ab Libitium", 20, 33);

  // boxes that show current score and high score
  currentScoreBox = new ScoreBox("current score", score);
  highScoreBox = new ScoreBox("high score", highScore);

}
