void setup() {

  size(500, 500);

  // body
  
  fill(127, 110, 255);
  triangle(100, 410, 200, 200, 300, 410);

  // face
  
  fill(224, 202, 128);
  ellipse(200, 180, 191, 200);

  // hands
  
  ellipse(100, 300, 42, 42);

  ellipse(300, 300, 42, 42);

  // mouth
  
  stroke(71, 20, 255);
  line(183, 246, 245, 230);

  // glasses frames
  
  stroke(87, 255, 20);
  line(107, 163, 292, 163);

  // glasses lenses
  
  fill(199, 60, 10);
  rect(132, 152, 50, 38);

  rect(215, 152, 50, 38);
}
