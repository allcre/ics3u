void helpIcon() {
  //circle 
  strokeWeight(5);
  noFill();
  stroke(255); // white
  ellipseMode(CORNER);
  ellipse(width - 49, height - 49, 37, 37);
  
  // question mark
  fill(255);
  textSize(30);
  text("?", width - 37, height - 39);
}
