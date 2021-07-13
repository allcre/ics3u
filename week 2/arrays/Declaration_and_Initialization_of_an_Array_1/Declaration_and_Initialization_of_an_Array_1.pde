float array [] = new float [10];

void setup() {
  for (int i = 0; i < array.length; i++) {
    array[i] = random(0, 100);
    delay(300);
    println(array[i]);
  }
}
