//Author Mastermind
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Numerics;

namespace RSA_Cryptography
{
    class Program
    {
        static void Main(string[] args)
        {
            BigInteger e = 65537;

            BigInteger p = BigInteger.Parse(Console.ReadLine());
            BigInteger q = BigInteger.Parse(Console.ReadLine());
            BigInteger cipher = BigInteger.Parse(Console.ReadLine());

            BigInteger n = p * q;
            BigInteger phiN = n - p - q + 1;

            ExtendedEuclideanAlgorithm(phiN, e, out var gcd, out var aCoof, out var bCoof);

            BigInteger d = phiN + bCoof;

            BigInteger deciphered = BigInteger.ModPow(cipher, d, n);
            string decoded = Decode(deciphered);

            Console.WriteLine(decoded);
            Console.Read();
        }

        private static string Decode(BigInteger deciphered)
        {
            string asciiData = deciphered.ToString();

            StringBuilder message = new StringBuilder();

            for(int shift = 0; shift < asciiData.Length; shift += 2)
            {
                string currentAsciiCode = asciiData.Substring(shift, 2);

                if (currentAsciiCode == "00") return message.ToString();

                char currentChar = (char)int.Parse(currentAsciiCode);

                message.Append(currentChar);
            }

            return message.ToString();
        }


        static void ExtendedEuclideanAlgorithm(BigInteger a, BigInteger b, out BigInteger gcd, out BigInteger aCoof, out BigInteger bCoof)
        {
            BigInteger tempA = a;
            BigInteger tempB = b;

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

            BigInteger Sprev = 1;
            BigInteger Scur = 0;
            BigInteger Snext;

            BigInteger Tprev = 0;
            BigInteger Tcur = 1;
            BigInteger Tnext;

            BigInteger q, r = -1;


            while (true)
            {
                q = a / b;
                r = a % b;

                if (r == 0) break;

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
