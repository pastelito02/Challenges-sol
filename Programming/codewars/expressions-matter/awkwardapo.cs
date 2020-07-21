/*awkwardapo*/
using System;
using System.Linq;


public class Kata
{
    public static int ExpressionsMatter(int a, int b, int c)
    {
     int[] res =
     {
     a*b*c,
     a*b+c,
     a*(b+c),
     (a+b)*c,
     a+b*c,
     a+b+c
     };
     return res.Max();
    }
}
