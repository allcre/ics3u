int helpDiameter, helpCenter;

void helpIcon() {
  //circle 
  helpDiameter = 37;
  helpCenter = width - 29;
  strokeWeight(5);
  noFill();
  stroke(255); // white
  ellipse(helpCenter, helpCenter, helpDiameter, helpDiameter);
  
  // question mark
  fill(255);
  textSize(30);
  text("?", width - 35, height - 39);
}
