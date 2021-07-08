void setup(){
  size(420, 120);
  smooth();
  strokeWeight(12);
  strokeJoin(ROUND);
  rect(40, 25, 70, 70);
  strokeJoin(BEVEL);
  fill(50, 200, 50);
  rect(140, 25, 70, 70);
  strokeCap(SQUARE);
  line(270, 25, 340, 95);
  stroke(100, 45, 70);
  strokeCap(ROUND);
  line(350, 25, 420, 95);
}
