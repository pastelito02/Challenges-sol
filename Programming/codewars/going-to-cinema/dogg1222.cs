/*dogg1222*/
using System;

public class MovieC
{
  public static int Movie(int card, int ticket, double perc)
  {
    int a = 0;
    double b = card;
    int times = 0;
    while(Math.Ceiling(b) >= a)
    {
      a += ticket;
      b += ticket * Math.Pow(perc, ++times);
    }
    return times;
  }
}
