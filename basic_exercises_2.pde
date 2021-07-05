void setup() {

  size(600, 600); // sets the size of the window

  //drawing the mohawk
  strokeWeight(2);

  stroke(255, 0, 0);
  line(301, 46, 300, 4);

  stroke(#FFC503);
  line(301, 48, 309, 9);

  stroke(#FF036C);
  line(304, 48, 317, 15);


  stroke(0, 0, 0);
  strokeWeight(5);

  ellipse(300, 100, 100, 100); // draws the head

  line(300, 150, 300, 300); // draws the body

  line(300, 300, 250, 400); // draws the left leg

  line(300, 300, 350, 400); // draws the right leg

  line(300, 225, 232, 246); // draws the left arm
  line(232, 246, 292, 239);

  line(300, 225, 349, 195); // draws the right arm
  line(349, 195, 376, 140);

  //right hand
  strokeWeight(3);
  strokeJoin(ROUND);
  fill(0, 0, 0);
  rect(369, 128, 15, 10);

  // making a 'rock on' symbol with fingers
  line(368, 132, 356, 126);
  line(369, 128, 367, 112);
  line(385, 128, 388, 111);

  // drawing the guitar
  strokeWeight(10);
  line(208, 178, 321, 257); // guitar neck

  fill(255, 0, 0); // body
  stroke(255, 255, 255);
  strokeWeight(5);
  beginShape();
  vertex(321, 257);
  vertex(363, 332);
  vertex(409, 264);
  endShape(CLOSE);

  strokeWeight(2); // strings
  stroke(0, 0, 0);
  line(325, 258, 376, 311);
  line(326, 258, 384, 301);
  line(327, 258, 392, 289);

  strokeWeight(10);

  ellipse(285, 85, 10, 10); // draws the left eye

  ellipse(315, 85, 10, 10); // draws the right eye

  line(280, 120, 320, 120); // draws the mouth

  text("Stick Man rocks on", 280, 420); // writing underneath the stick man
}
