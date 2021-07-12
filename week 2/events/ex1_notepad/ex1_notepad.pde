String typing = "";

void setup() {
  size(600, 600);
  textSize(14);
  fill(0);
}

void draw() {
  background(255);
  text(typing, 20, 20);
}

void keyPressed() {
  
  if (keyCode != 16 && keyCode != 8)
    typing = typing + key;
  else if (keyCode == 8)
    typing = typing.substring(0, typing.length() - 1);
  
  print("key: " + key + " code: " + keyCode + "\n");
}
