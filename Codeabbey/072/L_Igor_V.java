//Author L_Igor_V
import java.util.Scanner;
public class Solution {
    public static void main(String args[]){
        Scanner scanner = new Scanner(System.in);
        int words = scanner.nextInt();
        int x0 = scanner.nextInt();
        String consonant = "bcdfghjklmnprstvwxz";
        String vowels = "aeiou";
        int a = 445;
        int c = 700001;
        int m = 2097152;
        for(int j=0; j < words; j++) {
            String word = "";
            int length = scanner.nextInt();
            for (int i = 0; i < length; i++) {
                int xnext = (a * x0 + c) % m;
                x0 = xnext;
                if (i % 2 == 0) {
                    word += consonant.charAt(xnext % 19);
                } else {
                    word += vowels.charAt(xnext % 5);
                }
            }
            System.out.print(word + " ");
        }
    }
}
