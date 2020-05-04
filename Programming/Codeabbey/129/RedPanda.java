//Author RedPanda
import java.util.Arrays;
import java.util.Scanner;

/**
 * @author Elena Kudryashova
 */
public class Solution {

  public static void main(String[] args) {

    String s = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Scanner scanner = new Scanner(System.in);
    int m = scanner.nextInt();

    Long[][] c = new Long[36][36];
    Arrays.fill(c[0], 1L);
    c[1][1] = 1L;
    c[1][0] = 1L;
    for (int ii = 2; ii < 36; ii++) {
      c[ii][0] = 1L;
      c[ii][1] = c[ii - 1][1] * ii / (ii - 1);
      for (int jj = 2; jj <= ii; jj++) {
        c[ii][jj] = c[ii][jj - 1] * (ii - jj + 1) / jj;
      }
    }

    for (int l = 0; l < m; l++) {
      int n = scanner.nextInt();
      int k = scanner.nextInt();
      long i = scanner.nextLong();
      int idx = 0;

      for (int jj = 0; jj < k; jj++) {
        while (i >= c[n - 1 - idx][k - 1 - jj]) {
          i -= c[n - 1 - idx][k - 1 - jj];
          idx++;
        }
        System.out.print(s.charAt(idx));
        idx++;
      }
      System.out.print(" ");
    }
  }
}
