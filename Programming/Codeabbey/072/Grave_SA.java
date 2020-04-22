//Author Grave_SA
import java.util.*;
class Solution
{
    public static void main(String[] args)
    {
        char[] cons = {'b','c','d','f','g','h','j','k','l','m','n','p','r','s','t','v','w','x','z'};
        char[] vow = {'a','e','i','o','u'};

        Scanner scanner = new Scanner(System.in).useDelimiter(" ");
        int cases = scanner.nextInt();
        String s = scanner.nextLine();
        int seed = Integer.parseInt(s.substring(1,s.length()));

        while(scanner.hasNextInt())
        {
            int wordLength = scanner.nextInt();
            //A = 445, C = 700001, M = 2097152
            //Xnext = (A * Xcur + C) % M

            int xCur = seed;

            String result = "";

            for(int i = 0; i < wordLength; i++)
            {
                xCur = (445 * xCur + 700001)%2097152;
                if(i%2 == 0)
                {
                    result += cons[xCur%19];
                }else
                {
                    result += vow[xCur%5];
                }
            }
            seed = xCur;
            System.out.print(result + " ");
        }
        scanner.close();
    }
}
