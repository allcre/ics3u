void setup() {
  size(600, 600);

  background(255);

  for (int i = 0; i < 50; i++) {
    fill(random(255), 0, 0);
    float side = random(100);
    rect(random(600), random(600), side, side);
  }

  for (int i = 0; i < 20; i++) {
    fill(0, random(255), 0);
    float side = random(100);
    ellipse(random(600), random(600), side, side);
  }

  for (int i = 0; i < 10; i++) {
    stroke(0, 0, random(255));
    line(random(600), random(600), random(600), random(600));
  }
}
