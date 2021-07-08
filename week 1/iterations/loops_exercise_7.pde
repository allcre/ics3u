void setup() {
  size(600, 600);
  
  for (int i = 0; i <= width; i += 50) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
}
