void setup() {

  print("The Armstrong numbers between 1 and 500 are: ");

  for (int num = 1; num <= 500; num++) { // for all numbers between 1 and 500
    float sum = 0; // set sum of cubes of digits to 0
    int newNum = num; // duplicate variable of original number

    while (newNum > 0) { // while number is greater than 0
      sum += pow(newNum % 10, 3); // take the last digit of the number, cube it, add it to the sum
      newNum = floor(newNum / 10); // divide number by 10 and round down to remove the last digit of the number
    }

    if (sum == num) // if the sum of the cubes of the digits is equal to the number
      print("\n" + num); // print the number
  }
}
