int [][] grid = { {1, 2, 3, 4}, {1, 4, 9, 5}, {4, 6, 8, 6}} ;

// 1. 3 rows, 4 columns

void setup() {
  println("Data values of 1:");

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] == 1)
        println(i + ", " + j);
    }
  }

  println("\nEven numbers: ");

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] % 2 == 0)
        println(i + ", " + j);
    }
  }
}
