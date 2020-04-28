//Author DonRoberts

import java.util.*;

import java.text.DecimalFormat;

public class DonRoberts{
    public static void main(String [] args){
        Scanner scan = new Scanner(System.in);
        int T = scan.nextInt();

       for (int i =0; i < T; i++){
           double D1 = scan.nextDouble();
           double A = Math.toRadians(scan.nextDouble());
           double B = Math.toRadians(scan.nextDouble());

           double H = (Math.tan(A) * D1* Math.tan(B)) /(Math.tan(B)-Math.tan(A));
           DecimalFormat df = new DecimalFormat("##");
           df.format(H);
           System.out.print(Math.round(H) + " ");
       }
       scan.close();
    }

}
