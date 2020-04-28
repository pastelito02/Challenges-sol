//Author KARASIQUE99
import java.util.*;

public class KARASIQUE99 {
  public static void main(String[] args) {
    System.out.println(task());
  }

  public static String task() {
    StringBuilder sb = new StringBuilder();
    Scanner s = new Scanner(System.in);
    s.nextLine();
    String[] values = s.nextLine().split(" ");

    for (String value : values) {
      sb.append(getPrime(Integer.parseInt(value)));
      sb.append(" ");

    }
    s.close();
    return sb.toString().trim();
  }

  public static int getPrime(int n) {
    int count = 0;
    int output = 0;
    for (int i = 0; i < Integer.MAX_VALUE; i++) {
      if (isPrime(i)) {
        count++;
        output = i;
      }
      if (count == n)
        return output;
    }
    return -1;
  }

  public static boolean isPrime(int n) {
    if (n <= 1)
      return false;
    int count = 0;
    for (int i = 2; i < Math.sqrt(n + 1); i++) {
      if (n % i == 0)
        count++;
    }
    if (count > 0)
      return false;
    return true;
  }
}
