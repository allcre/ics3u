void easyModeText() {
  //button to rearrange
  noStroke();
  fill(navy); 
  rect(254, 611, 168, 30, 10);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  String msg;

  if (rearranging) // changes the text on the button depending on mode
    msg = "save";
  else
    msg = "rearrange";

  text(msg, width/2, 626);

  // text for under the button
  textSize(16);
  text("remaining: " + (3 - numRearrange), width/2, 655);
}
