Ball ball1;
Ball ball2;

void setup() {
  size(500, 500);

  ball1 = new Ball(100, 300, 350);
  ball2 = new Ball(50, 90, 100);
}

void draw() {
  ball1.display();
  ball2.display();
}
