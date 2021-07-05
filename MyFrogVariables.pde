//declaring the variables used to draw the frog.

color red, green, skyBlue, pink;

int x, y;

int headSize, eyeSize, pupilSize, mouthSize;

void setup() {

  size(500, 500);


  ///ADD CODE HERE TO GIVE THE VARIABLES DECLARED

  // ABOVE A VALUE

  red = color(255, 0, 0);
  green = color(0, 255, 0);
  skyBlue = color(150, 215, 255);
  pink = color(255, 94, 244);
  
  x = 100;
  y = 100;
  
  headSize = 200;
  eyeSize = 18;
  pupilSize = 5;
  mouthSize = 100;
  
  String message = "It's not easy being green";

  //Draw commands are below, do not modify this code.

  background(skyBlue);



  //The commands below draw the frog face

  fill(green);

  ellipse(x, y, headSize, headSize);

  fill(255);

  ellipse(x-50, y-30, eyeSize, eyeSize);

  ellipse(x+50, y-30, eyeSize, eyeSize);

  fill(0);

  ellipse(x-50, y-30, pupilSize, pupilSize);

  ellipse(x+50, y-30, pupilSize, pupilSize);

  fill(pink);

  ellipse(x, y+30, mouthSize, mouthSize/2);
  
  
  // upper right corner frog
  
  x = 400;
  
  fill(green);
  
  ellipse(x, y, headSize, headSize);

  fill(255);

  ellipse(x-50, y-30, eyeSize, eyeSize);

  ellipse(x+50, y-30, eyeSize, eyeSize);

  fill(0);

  ellipse(x-50, y-30, pupilSize, pupilSize);

  ellipse(x+50, y-30, pupilSize, pupilSize);

  fill(pink);

  ellipse(x, y+30, mouthSize, mouthSize/2);
  
  
  // lower right corner frog
  
  y = 400;
  
  fill(green);
  
  ellipse(x, y, headSize, headSize);

  fill(255);

  ellipse(x-50, y-30, eyeSize, eyeSize);

  ellipse(x+50, y-30, eyeSize, eyeSize);

  fill(0);

  ellipse(x-50, y-30, pupilSize, pupilSize);

  ellipse(x+50, y-30, pupilSize, pupilSize);

  fill(pink);

  ellipse(x, y+30, mouthSize, mouthSize/2);
  
  
  // lower left corner frog
  
  x = 100;
  
  fill(green);
  
  ellipse(x, y, headSize, headSize);

  fill(255);

  ellipse(x-50, y-30, eyeSize, eyeSize);

  ellipse(x+50, y-30, eyeSize, eyeSize);

  fill(0);

  ellipse(x-50, y-30, pupilSize, pupilSize);

  ellipse(x+50, y-30, pupilSize, pupilSize);

  fill(pink);

  ellipse(x, y+30, mouthSize, mouthSize/2);
  
  
  // text
  
  fill(0, 0, 0);
  
  textAlign(CENTER, CENTER);
  text(message, 250, 250);
}
