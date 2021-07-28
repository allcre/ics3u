// draws the text that is shown in a hard game
void hardModeText() {
  fill(255); // white
  textAlign(CENTER, CENTER); // centered
  textSize(25);
  text("moves until shuffle: " + (15 - moves), width/2, 630); // writes moves until the next shuffle
}
