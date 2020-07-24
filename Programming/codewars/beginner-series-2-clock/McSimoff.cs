/*McSimoff*/
using System;
  public static class Clock
  {
    public static int Past(int h, int m, int s)
    {
      return (int)(new TimeSpan(h, m, s)).TotalMilliseconds;
    }
  }
