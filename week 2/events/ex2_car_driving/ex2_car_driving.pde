int carX = 50;
int carY = 50;
boolean vertical = false;
int wheel = 10;

void setup() {
  size(500, 500);
}

void draw() {
  background(200);
  fill(255, 9, 100);

  if (vertical) {
    // car body
    rect(carX - 10, carY - 30, 20, 60);

    // wheels
    fill(0);
    rect(carX - 20, carY - 30, wheel, wheel);
    rect(carX - 20, carY + 20, wheel, wheel);
    rect(carX + 10, carY - 30, wheel, wheel);
    rect(carX + 10, carY + 20, wheel, wheel);
  } else {
    // car body
    rect(carX - 30, carY - 10, 60, 20);

    // wheels
    fill(0);
    rect(carX - 30, carY - 20, wheel, wheel);
    rect(carX - 30, carY + 10, wheel, wheel);
    rect(carX + 20, carY - 20, wheel, wheel);
    rect(carX + 20, carY + 10, wheel, wheel);
  }
}

void keyPressed() {
  print("key: " + key + " code: " + keyCode + "\n"); 

  if (keyCode == 38 && carY > 30) { // up arrow
    carY -= 10;
    vertical = true;
  } else if (keyCode == 39 && carX < width - 30) { // right arrow
    carX += 10;
    vertical = false;
  } else if (keyCode == 40 && carY < height - 30) { // down arrow
    carY += 10;
    vertical = true;
  } else if (keyCode == 37 && carX > 30) { // left arrow
    carX -= 10;
    vertical = false;
  }
}
