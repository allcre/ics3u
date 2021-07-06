void setup() {
  size(600, 600);

  // rolling dice

  int diceNum = (int) random(1, 7); // random number from 1 to 6

  text("You rolled a " + diceNum + ".", 250, 300);

  if (diceNum < 3) { // if they roll less than 3
    text("Low", 250, 430); // low message
  } else if (diceNum == 3) { // if they roll a 3
    text("Nice 3", 250, 430); // three message
  } else if (diceNum < 6) { // if they roll a 4 or a 5
    text("High", 250, 430); // high message
  } else { // if none of the above options happened
    text("Wow!", 250, 430); // six message
  }
}
