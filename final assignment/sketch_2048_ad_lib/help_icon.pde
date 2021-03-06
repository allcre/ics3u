int helpDiameter, helpCenter; // measurements of the button (for clicking it)

// draws the '?' icon to show instructions
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
  textAlign(LEFT, TOP);
  text("?", width - 35, height - 39);
}
