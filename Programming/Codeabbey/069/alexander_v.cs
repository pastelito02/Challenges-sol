//Author alexander_v
using System;
using System.Collections.Generic;
using System.Numerics;

namespace Fibonacci_Divisibility
{
  class Program
  {
    static void Main()
    {
      int count = int.Parse(Console.ReadLine());
      int[] nums = Array.ConvertAll(Console.ReadLine().Split(' '), Convert.ToInt32);
      var fib = new List<BigInteger>();
      fib.Add(0);
      fib.Add(1);
      int it = 0;
      int pos = 0;
      foreach(int n in nums)
      {
        for(int i = 0; i < fib.Count; i++)
        {
          if(fib[i] % n == 0 && i != 0)
          {
            pos = i;
            goto l1;
          }
        }
        while((fib[fib.Count - 1] % n) != 0)
        {
          fib.Add(fib[it] + fib[it + 1]);
          it++;
          pos = it + 1;
        }
        l1:
        Console.WriteLine(pos + " ");
      }
    }
  }
}
