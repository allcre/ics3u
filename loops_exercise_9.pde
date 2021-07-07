void setup() {
  size(600, 600);
  strokeWeight(5);
  for (int x = 0; x <= width; x += 50) {
    for (int y = 0; y <= height; y += 50) {
      point(x, y);
    }
  }
}
