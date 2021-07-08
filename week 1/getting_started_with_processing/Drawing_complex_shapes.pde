void setup() {
  size(600, 500);

  beginShape(); 

  vertex(30, 30);

  vertex(30, 130);

  vertex(100, 75);

  endShape(CLOSE);
  
  arc(90, 60, 80, 80, 0, HALF_PI);
  arc(190, 60, 80, 80, 0, PI+HALF_PI);
  arc(290, 60, 80, 80, PI, TWO_PI+HALF_PI);
  arc(390, 60, 80, 80, QUARTER_PI, PI+QUARTER_PI);
}

void draw() {
}

void mousePressed() {

  print("x: " + mouseX + " y: "+ mouseY +"\n");
}
