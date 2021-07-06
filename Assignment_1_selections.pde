int x, y;
float distance;

void setup() {
  size(660, 660);
  background(255);
  x = width/2;
  y = height/2;
}

void draw() {

  distance = dist(mouseX, mouseY, x, y);
  fill(255);

  if (distance < 300 && distance > 200) {
    fill(255, 0, 0);
    ellipse(x, y, 600, 600);
    
    fill(255);
    noStroke();
    ellipse(mouseX, mouseY, 20, 20);
  } else {
    stroke(0);
    ellipse(x, y, 600, 600);
  }

  if (distance <= 200 && distance > 100) {
    fill(0, 255, 0);
    ellipse(x, y, 400, 400);
  } else {
    stroke(0);
    fill(255);
    ellipse(x, y, 400, 400);
  }

  if (distance <= 100) {
    fill(255, 255, 0);
    ellipse(x, y, 200, 200);
  } else {
    fill(255);
    ellipse(x, y, 200, 200);
  }
}
