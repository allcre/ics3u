void setup() {
  println(even(5)); // print true/false for an argument of 5
}

// function that returns a boolean and has one integer as an argument
boolean even(int x) {
  if (x % 2 == 0) // if even
    return true;
  else // if odd
    return false;
}
