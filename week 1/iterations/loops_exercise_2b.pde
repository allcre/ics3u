void setup() {
  size(430, 680);
}

void draw() {
  fill(255, 204, 233);

  for (int i = 1; i < 6; i++) {
    ellipse(map(i, 1, 6, 0, width) + 43, map(i, 1, 6, 0, height) + 68, 80, 130);
  }
}
