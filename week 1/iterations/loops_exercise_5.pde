void setup() {
  size(650, 250); 
  int side = 50;
  int x = 50;

  for (int i = 0; i < 6; i++) {
    fill(random(255), random(255), random(255));
    rect(x, 50, side, side);
    x += 100;
  }

  for (x = 50; x < 551; x += 100) {
    fill(random(255), random(255), random(255));
    rect(x, 150, side, side);
  }
}
