void setup() {

  size(600, 300);
  
  background(156, 210, 255);
  
  // left creature
  
  fill(56, 112, 76);
  beginShape();
  vertex(40, 300);
  vertex(122, 247);
  vertex(132, 188);
  vertex(65, 128);
  vertex(253, 189);
  vertex(200, 212);
  vertex(259, 233);
  vertex(177, 259);
  vertex(171, 300);
  endShape(CLOSE);
  
  // right creature
  
  fill(82, 59, 30);
  beginShape();
  vertex(464, 300);
  vertex(447, 256);
  vertex(350, 241);
  vertex(408, 229);
  vertex(352, 211);
  vertex(520, 157);
  vertex(486, 216);
  vertex(508, 261);
  vertex(576, 300);
  endShape(CLOSE);
  
  // eyes
  
  strokeWeight(15);
  point(182, 185);
  point(422, 202);
}
