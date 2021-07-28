// basic objects the screen shows in an easy game

void easyModeText() {
  //button to rearrange
  noStroke();
  fill(navy);
  rect(254, 611, 168, 30, 10);

  // text on the button
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  String msg; // words on the button

  if (rearranging) // changes the text on the button depending on if tiles are being rearranged
    msg = "save";
  else
    msg = "rearrange";

  text(msg, width/2, 626);

  // text for under the button
  textSize(16);
  text("remaining: " + (3 - numRearrange), width/2, 655); // shows remaining rearranges
}
