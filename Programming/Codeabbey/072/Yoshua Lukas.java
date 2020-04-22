//Author Yoshua Lukas
import java.util.Scanner;

public class FunnyWordGenerator {

    public static void main(String[] args) {
        String k = "bcdfghjklmnprstvwxz",v = "aeiou";
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt(), seed = sc.nextInt();
        for (; n > 0; n--) {
            int nWord = sc.nextInt();
            char[] chars = new char[nWord];
            int[] w = new int[nWord];
            for (int i = 0; i < nWord; i++) {
                int XCur = i == 0 ? seed : w[i - 1];
                w[i] = ((445 * XCur + 700001) % 2097152);
            }
            seed = w[w.length - 1];
            for (int i = 0; i < w.length; i++) {
                chars[i] = i % 2 == 0 ? k.charAt(w[i] % k.length()): v.charAt(w[i] % v.length());
            }
            String word = String.valueOf(chars);
            System.out.print(word + " ");
        }
        sc.close();
    }

}
