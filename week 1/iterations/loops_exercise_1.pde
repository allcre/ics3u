void setup() {
  size(500, 180);
  strokeWeight(10);

  int x = 30;
  int y = 50;

  for (int i = 0; i < 7; i++) {
    line(x, y, x + 62, y + 50);
    x += 62;
  }
}
