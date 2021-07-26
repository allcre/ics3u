// ELLIPSE MODE IS CORNER

void setup() {
  size(675, 675);
}

void draw() {
  background(#91ADC2); // pale blue background

  if (atHomeScreen) {
    homeScreen(); 
    helpIcon();
    homeIcon();
  }
}
