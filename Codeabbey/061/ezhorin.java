
//Author ezhorin
import java.util.Scanner;

/**
 * Created by EZhorin on 12.02.2016.
 */
public class ezhorin {

  public static int[] calculateSimpleNumbers(int countOfNumbers) {
    int n = countOfNumbers;
    int[] result = new int[/* countOfNumbers */ n];

    int cnt = 0;
    int i = 2;
    int j = i * i;

    boolean[] numbers = new boolean[n + 1];

    for (int b = 0; b < numbers.length; b++)
      numbers[b] = true;

    while (i * i <= n) {
      if (numbers[i]) {
        int k = 0;
        while (j <= n) {

          numbers[j] = false;
          k++;
          j = i * i + k * i;

        }
      }
      i++;
      j = i * i;
    }

    i = 2;
    cnt = 0;

    while (i < numbers.length) {
      if (numbers[i]) {
        result[cnt] = i;
        cnt++;
      }

      i++;
    }
    return result;
  }

  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);

    int iterCount = scan.nextInt();
    int[] resultArray = new int[iterCount];

    resultArray = calculateSimpleNumbers(3000000);

    int a = 0;

    for (int i = 0; i < iterCount; i++) {
      a = scan.nextInt();
      System.out.print(resultArray[a - 1] + " ");
    }
    scan.close();
  }
}
