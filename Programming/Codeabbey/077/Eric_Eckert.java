//Author Eric_Eckert
package pointToSegmentDistance;

import java.util.Scanner;

public class Solution {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        int numPoints = in.nextInt();
        
        for (int i = 0; i < numPoints; i++) {
            int x1 = in.nextInt();
            int y1 = in.nextInt();
            int x2 = in.nextInt(); 
            int y2 = in.nextInt();
            int xp = in.nextInt();
            int yp = in.nextInt();
            System.out.print(calcDist(x1, y1, x2, y2, xp, yp) + " ");
        }
        in.close();
    }

    private static double calcDist(double x1, double y1, double x2, double y2, double xp, double yp) {
        double d = Math.abs((y2-y1)*xp - (x2-x1)*yp + x2*y1 - y2*x1) /
                   Math.sqrt(Math.pow(y2-y1, 2) + Math.pow(x2-x1, 2));
        
        if (isProjectedPointOnLineSegment(x1, y1, x2, y2, xp, yp))
            return d;
        else
            return closest(x1, y1, x2, y2, xp, yp);
    }
    
    private static boolean isProjectedPointOnLineSegment(double x1, double y1, double x2, double y2, double xp, double yp)
    {
        double U = ((xp - x1) * (x2 - x1)) + ((yp - y1) * (y2 - y1));
        double Udenom = Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2);
        U /= Udenom;

        double xr = x1 + (U * (x2 - x1));
        double yr = y1 + (U * (y2 - y1));

        double minx = Math.min(x1, x2);
        double maxx = Math.max(x1, x2);
        double miny = Math.min(y1, y2);
        double maxy = Math.max(y1, y2);

        return (minx <= xr && xr <= maxx) && (miny <= yr && yr <= maxy);
    }

    private static double closest(double x1, double y1, double x2, double y2, double xp, double yp) {
        double d1 = Math.sqrt(Math.pow(xp-x1,2) + Math.pow(yp-y1, 2));
        double d2 = Math.sqrt(Math.pow(xp-x2,2) + Math.pow(yp-y2, 2));
        return Math.min(d1, d2);
    }
}
