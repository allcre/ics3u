void setup() {
  size(600, 600);

  int x = 0;
  int y = 0;

  color hue1 = color(random(255), random(255), random(255));
  color hue2 = color(random(255), random(255), random(255));
  strokeWeight(8);

  while (y <= height) {
    stroke(hue1);
    line(x, y, width, y);
    y += 75;

    stroke(hue2);
    line(x, y, width, y);
    y += 75;
  }
}
