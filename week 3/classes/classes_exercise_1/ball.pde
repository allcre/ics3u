class Ball {

  float radius;
  float x;
  float y;

  Ball(float tempRadius, float tempX, float tempY) {
    radius = tempRadius;
    x = tempX;
    y = tempY;
  }

  void display() {
    fill(0);
    ellipse(x, y, radius, radius);
  }
}
