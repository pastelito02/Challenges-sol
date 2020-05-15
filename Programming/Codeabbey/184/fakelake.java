//Author fakelake
package matchespicking;

import java.util.Scanner;

public class MatchesPicking {
    public static void main(String[] args) {
        System.out.println("Эта программа показывает сколько спичек надо взять за первый ход, чтобы победить в игре.");
        System.out.println("Введите количество тесткейсов:");
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        System.out.println("Введите количество спичек, максимальное число спичек, которое можно взять за один раз, и выйигрышное правило, нажмите <Enter>:");
        Scanner in2 = new Scanner(System.in);
        String result = "";
        int rst;
        for (int i=0; i<t; i++) {
            String str = in2.nextLine();
            String[] s = str.split(" ");
            int m = Integer.parseInt(s[0]);
            int k = Integer.parseInt(s[1]);
            char r = s[2].charAt(0);
            rst = m % (k + 1);
            if (r == 'n') 
                result += rst + " ";
            else {
                rst--;
                if (rst < 0) 
                    result += k + " ";
                else
                    result += rst + " ";
            }               
        }
        System.out.println("Результат: " + result);
    }    
}
