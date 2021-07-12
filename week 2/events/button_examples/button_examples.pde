int w = 125;
int h = 60;
int x = 430;

void setup() {
  size(600, 500);

  // white square
  rect(20, 20, 375, 375);

  fill(100);

  rect(x, 20, w, h);

  rect(x, 118, w, h);

  rect(x, 216, w, h);

  ellipse(x + 62, 340, 90, 90);

  textAlign(CENTER, CENTER);
  fill(0);
  textSize(24);
  text("Circle", x + 62, 335);

  fill(255, 0, 0);
  text("Square", x + 62, 50);

  fill(0, 255, 0);
  text("Triangle", x + 62, 148);

  fill(0, 0, 255);
  text("Rectangle", x + 62, 246);
} // end of setup function

void draw() {
}

void mousePressed() {

  if (mouseX > 430 && mouseX < 555); 
  {

    if (mouseY > 20 && mouseY < 80) {
      // redraw white background
      fill(255);
      rect(20, 20, 375, 375);

      // draw the red square
      fill(255, 0, 0);
      rect(60, 60, 100, 100);
    }

    if (mouseY > 118 && mouseY < 178) {
      fill(255);
      rect(20, 20, 375, 375);

      fill(0, 255, 0);
      triangle(100, 100, 150, 160, 50, 150);
    }

    if (mouseY > 216 && mouseY < 276) {
      fill(255);
      rect(20, 20, 375, 375);

      fill(0, 0, 255);
      rect(60, 60, 150, 50);
    }

    if (dist(mouseX, mouseY, 492, 340) < 45) {
      fill(255);
      rect(20, 20, 375, 375);

      fill(0);
      ellipse(200, 200, 100, 100);
    }
  }
}
