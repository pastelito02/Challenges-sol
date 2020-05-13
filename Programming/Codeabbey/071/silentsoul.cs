//Author silentsoul
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problems
{
  class Problem71
  {
    static void Main(string[] args)
    {
      int num = int.Parse(Console.ReadLine());
      var r = string.Empty;
      var tokens = Console.ReadLine().Split(' ').Select(v => int.Parse(v)).ToList();
      foreach (var t in tokens)
      {
        r += Find(t) + " ";
      }


      Console.WriteLine(r.Substring(0, r.Length - 1));
      Console.ReadKey();
    }

    private static int Find(int m)
    {
      var f0 = 0;
      var f1 = 1;
      var cnt = 1;
      while (true)
      {
        cnt++;
        var t = f1;
        f1 = (f1 + f0) % m;
        f0 = t;
        if (f1 == 0)
          return cnt;
      }
    }
  }
}
