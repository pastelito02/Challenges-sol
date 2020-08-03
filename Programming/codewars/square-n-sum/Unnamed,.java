import java.util.Arrays;

public class Kata {
  public static int squareSum(int[] xs) {
    return Arrays.stream(xs).map(x -> x * x).sum();
  }
}
