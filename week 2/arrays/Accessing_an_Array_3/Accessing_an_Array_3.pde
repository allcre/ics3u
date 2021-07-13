float [] coordinates = new float [40];

void setup() {
  size(500, 500);
  strokeWeight(5);

  for (int i = 0; i < coordinates.length; i++)
    coordinates[i] = random(500);

  for (int i = 0; i < coordinates.length - 1; i += 2)
    point(coordinates[i], coordinates[i + 1]);

  strokeWeight(1);

  for (int i = 0; i < coordinates.length; i += 2) {
    for (int x = 0; x < coordinates.length; x += 2) {
      stroke(random(255));
      line(coordinates[i], coordinates[i + 1], coordinates[x], coordinates[x+1]);
    }
  }
}
