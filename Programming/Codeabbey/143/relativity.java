//Author relativity
import java.util.Scanner;

public class ExtendedEuclideanAlgorithm {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();
        for (int i = 0; i < T; i++) {
            Algorithm a = new Algorithm(in.nextInt(),in.nextInt());
        }
    }
    
}

class Algorithm {
    
    Algorithm(int x, int y) {
        run(x,y);
    }
    
    private void run(int x, int y) {
        int d = gcd(x,y);
        int[] bezout = bezout(x,y);
        int a = bezout[0];
        int b = bezout[1];
        System.out.println(d + " " + a + " " + b + " ");
        
    }
    
    private int[] bezout(int x, int y) {
        int sPrev = 1;
        int sCurr = 0;
        int tPrev = 0;
        int tCurr = 1;
        int r = x%y;
        
        while (r != 0) {
            int q = x/y;
            int sNext = sPrev - q * sCurr;
            int tNext = tPrev - q * tCurr;
            
            x = y;
            y = r;
            r = x%y;
            sPrev = sCurr;
            sCurr = sNext;
            tPrev = tCurr;
            tCurr = tNext;
        }
        int[] result = {sCurr,tCurr};
        return result;
    }
    
    private int gcd(int x, int y) {
        if (x == 1 || y == 1) x = 1;
        while(x != y && x != 1) {
            if (x > y) x -= y;
            else y -= x;
        }
        int d = x;
        return d;
    }
    
}