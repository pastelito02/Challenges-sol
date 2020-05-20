//Author dimitor
using System;
using System.Linq;

namespace CodeabbeySolutions
{
    class Problem145
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("#145 Modular Exponentiation");

            Console.WriteLine("input:");
            int n = int.Parse(Console.ReadLine());
            long[] results = new long[n];

            for(int i=0; i<n; i++)
            {
                var S = Console.ReadLine().Split().Select(z => int.Parse(z)).ToArray();
                long a = S[0];
                long b = S[1];
                long m = S[2];
                results[i] = ModPow(a, b, m);
            }
            Console.WriteLine("output:");
            Console.WriteLine(string.Join(" ",results));
            Console.ReadKey();
        }

        static long ModPow(long a, long b, long m)
        {
            long result = 1;
            for (int i = 1; i <= b; i++)
                result = (result * a) % m;
            return result;
        }
    }
}
