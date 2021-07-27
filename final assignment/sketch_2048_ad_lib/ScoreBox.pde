class ScoreBox {

  ScoreBox(String scoreType, int score) {
    float x;
    float y;

    if (scoreType == "high score") {
      x = 385.88;
      y = 22;
    } else {
      x = 523.12;
      y = 22;
    }

    // box
    noStroke();
    fill(navy);
    rect(x, y, 122.62, 53, 10);

    // text on the box
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(scoreType, x + 61.31, y + 10); // label for score
    textSize(24);
    text(score, x + 61.31, y + 33); // score
  }
}
