int [] field = {2, 20, 3, 13, 15, 3, 9, 10, 1, 5, 8};
int odd = 0; // counter of odd numbers
int highest = field[0]; // first number to compare the others with to determine the highest/lowest value
int lowest = field[0];

void setup() {
  for (int i = 0; i < field.length; i++) {
    if (field[i] % 2 != 0)
      odd++;

    if (field[i] > highest)
      highest = field[i];

    if (field[i] < lowest)
      lowest = field[i];
  }
  println("Number of odd numbers: " + odd);
  println("Highest number: " + highest);
  println("Lowest number: " + lowest);
}
