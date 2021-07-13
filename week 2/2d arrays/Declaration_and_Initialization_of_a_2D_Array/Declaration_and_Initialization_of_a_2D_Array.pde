import java.util.Arrays;
int rows = 4;
int cols = 5;
int [][] array2d = new int [rows][cols];

void setup() {

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      array2d[i][j] = -1;
    }
  }

  array2d[3][4] = 0;
  array2d[0][2] = 0;
  array2d[2][2] = 2;

  print2DArray(array2d);
}

void print2DArray(Object[] a) {
  println(Arrays.deepToString(a)
    .replace("[[", "")
    .replace("], [", "\n")
    .replace("]]", "")
    .replace(" ", " "));
}
