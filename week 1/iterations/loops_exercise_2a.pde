void setup() {
  size(600, 250);
}

void draw() {
  fill(255, 204, 233);

  for (int x = 65; x < width - 50; x += 115) {
    ellipse(x, 125, 100, 200);
  }
}
