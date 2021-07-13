int [] x = new int [15];
int [] y = new int [15];
int [] square = new int [15];

void setup() {
  size(500, 500);

  for (int i = 0; i < x.length; i++) {
    x[i] = (int) random(width - 89);
    y[i] = (int) random(width - 89);
    square[i] = (int) random(50, 91);

    rect(x[i], y[i], square[i], square[i]);
  }
}
