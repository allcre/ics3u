void setup() {
  size(910, 512);

  background(124, 198, 235);

  // bottom bar

  noStroke();
  fill(102, 102, 102);
  rect(0, 480, 910, 32);

  fill(255, 255, 255);
  textSize(20);
  text("5:12", 860, 503); // time

  // window

  strokeJoin(ROUND);
  fill(#EEEEEE);
  rect(100, 60, 600, 400);

  // window icons (minimize, full screen, close)

  noFill();
  stroke(79, 79, 79);
  strokeWeight(2);
  rect(670, 69, 7, 7); // full screen icon

  fill(79, 79, 79);
  textSize(16);
  text("- \t \t \t x", 654, 78); // x and _ icons

  // drawing of mickey mouse

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(455, 256, 200, 200); // head

  ellipse(347, 157, 110, 110); // left ear
  ellipse(563, 157, 110, 110); // right ear

  // white parts of the face

  noStroke();
  fill(255, 255, 255);
  ellipse(426, 237, 70, 120); // behind the eyes
  ellipse(484, 237, 70, 120);

  stroke(255, 255, 255);
  strokeWeight(80);
  line(376, 298, 457, 333); // left cheek
  line(534, 298, 453, 333); // right cheek

  noStroke();
  fill(0, 0, 0);
  ellipse(455, 290, 60, 37); // nose
  arc(455, 325, 56, 56, 0, PI); // mouth

  stroke(0, 0, 0);
  strokeWeight(3);
  noFill();
  arc(455, 300, 120, 60, 0, PI); // mouth line
  arc(455, 285, 80, 37, radians(225), radians(315)); // line above nose

  ellipse(435, 239, 25, 58); // left eye
  ellipse(475, 239, 25, 58); // right eye

  stroke(#EEEEEE);
  strokeWeight(50);
  ellipse(455, 256, 250, 250); // circle outline that covers the excess of the white shapes

  fill(0, 0, 0);
  noStroke();
  ellipse(347, 157, 110, 110); // left ear
  ellipse(563, 157, 110, 110); // right ear

  ellipse(436, 253, 15, 29); // left pupil
  ellipse(474, 253, 15, 29); // right pupil
}
