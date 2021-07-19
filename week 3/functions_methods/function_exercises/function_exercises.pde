int x, y, z;

void setup() {
  initializeVars(5);
  println(x + " " + y + " " + z);

  sum(1001, 2);

  sum1(20, 5);
  
  println(even(5));
}

void initializeVars(int value) {
  x = value;
  y = value;
  z = value;
}

void sum(int num1, int num2) {
  println(num1 + num2);
}

int sum1(int num1, int num2) {
  return num1 + num2;
}

boolean even(int x) {
  if (x % 2 == 0)
    return true;
  else
    return false;
}
