//Author Severus Tacitus
import java.util.*;
class p68
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner (System.in);
        String[] line1 = sc.nextLine ().split (" ");
        int N = Integer.parseInt (line1[0]);
        int X0 = Integer.parseInt (line1[1]);
        final char[] consonant = "bcdfghjklmnprstvwxz".toCharArray ();
        final char[] vowel = "aeiou".toCharArray ();
        String[] line2 = sc.nextLine ().split (" ");
        for (String it : line2) {
            int wordLen = Integer.parseInt (it);
            for (int i = 0; i < wordLen; ++i)
            {
                X0 = (445 * X0 + 700001) % 2097152;
                if (i % 2 == 0)
                {
                    System.out.print (consonant[X0 % 19]);
                } else
                {
                    System.out.print (vowel[X0 % 5]);
                }
            }
            System.out.print (" ");
        }
    }
}
