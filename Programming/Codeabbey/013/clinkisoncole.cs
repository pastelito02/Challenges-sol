//Author clinkisoncole
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Weighted_sum_of_digits
{
  class Program
  {
    static void Main(string[] args)
    {
      int i = int.Parse(Console.ReadLine());
      string ans = null;
      string[] input = Console.ReadLine().Split(' ');
      int[] var = Array.ConvertAll(input, int.Parse);

      for ( int j = 0; j < i; j++)
      {
        int sum = 0;
        int a = var[j];
        int d = 0;
        int c = 0;
        while ( a != 0)
        {
          c = a % 10;
          a = a / 10;
          sum = sum + c * (input[j].Length - d);
          d++;
        }
        ans = ans + Convert.ToString(sum) + ' ';
      }
      Console.Write(ans.Trim());
      Console.ReadKey();
    }
  }
}
