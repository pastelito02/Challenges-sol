//Author Mastermind
using System;
//using System.Numerics;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
//using System.Text;

using System.IO;
//using System.Text.RegularExpressions;
using System.Diagnostics;


namespace testapp
{
    class Program
    {
        static void Main()
        {
            var casesCount = int.Parse(Console.ReadLine());

            var cases = new List<int[]>();

            while(casesCount-- > 0)
            {
                cases.Add(Console.ReadLine().Split(' ').Select(int.Parse).ToArray());
            }

            foreach(var currCase in cases)
            {
                var a = currCase[0];
                var b = currCase[1];

                int gcd, aCoof, bCoof;

                ExtendedEuclideanAlgorithm(a, b, out gcd, out aCoof, out bCoof);

                Console.Write(string.Format("{0} {1} {2} ", gcd, aCoof, bCoof));
            }

            Console.Read();
        }



        static void ExtendedEuclideanAlgorithm(int a, int b, out int gcd, out int aCoof, out int bCoof)
        {
            var tempA = a;
            var tempB = b;

            while (a != b)
            {
                if (a > b)
                    a %= b;
                else
                    b %= a;

                if (a == 0)
                {
                    gcd = b;
                    goto gcdFound;
                }
                else if (b == 0)
                {
                    gcd = a;
                    goto gcdFound;
                }
            }

            gcd = a;

            gcdFound:

            a = tempA;
            b = tempB;

            var Sprev = 1;
            var Scur  = 0;
            int Snext;

            var Tprev = 0;
            var Tcur = 1;
            int Tnext;

            int q, r = -1;


            while (true)
            {
                q = a / b;
                r = a % b;

                if (r == 0) break;

                // X <-- Y <-- r
                // Sprev <-- Scur <-- Snext
                // Tprev <-- Tcur <-- Tnext


                a = b;
                b = r;

                Snext = Sprev - q * Scur;
                Sprev = Scur;
                Scur = Snext;

                Tnext = Tprev - q * Tcur;
                Tprev = Tcur;
                Tcur = Tnext;
            } 

            aCoof = Scur;
            bCoof = Tcur;
        }
    }
}