//Author Signum_X
using System.Numerics;
using System.Text;

namespace CodeAbbey
{
    class Problem_153 : Problem
    {
        public Problem_153() : base(153, "Fermat goes hacking RSA", "http://www.codeabbey.com/index/task_view/fermat-goes-hacking-rsa") { }

        internal override void Solve(string[][] input, System.Text.StringBuilder output)
        {
            const int e = 65537;

            BigInteger n = BigInteger.Parse(input[0][0]);
            BigInteger c = BigInteger.Parse(input[1][0]);

            BigInteger p, q;
            GetPQ(n, out p, out q);

            BigInteger modulus = p * q;
            BigInteger d = GetInverse(e, modulus - p - q + 1);
            BigInteger message = BigInteger.ModPow(c, d, modulus);

            WriteMessageString(message, output);
        }

        private void GetPQ(BigInteger n, out BigInteger p, out BigInteger q)
        {
            BigInteger a = Sqrt(n);

            if (a * a < n)
                ++a;

            BigInteger b = a * a - n;

            while (true)
            {
                BigInteger sqrtB = Sqrt(b);

                if (sqrtB * sqrtB == b)
                {
                    p = a - sqrtB;
                    q = a + sqrtB;
                    return;
                }

                ++a;
                b = a * a - n;
            }
        }

        private BigInteger Sqrt(BigInteger value)
        {
            BigInteger r = 1;

            while (true)
            {
                BigInteger d = value / r;

                r = (r + d) / 2;

                if (BigInteger.Abs(d - r) < 2)
                    return r;
            }
        }

        private BigInteger GetInverse(BigInteger value, BigInteger modulus)
        {
            BigInteger xt = modulus;
            BigInteger yt = value;
            BigInteger aPrevious = 1;
            BigInteger aCurrent = 0;
            BigInteger bPrevious = 0;
            BigInteger bCurrent = 1;

            while (true)
            {
                BigInteger r;
                BigInteger q = BigInteger.DivRem(xt, yt, out r);

                if (r == 0)
                {
                    while (bCurrent < 0)
                        bCurrent += modulus;

                    return bCurrent;
                }

                BigInteger aNext = aPrevious - q * aCurrent;
                BigInteger bNext = bPrevious - q * bCurrent;

                xt = yt;
                yt = r;
                aPrevious = aCurrent;
                aCurrent = aNext;
                bPrevious = bCurrent;
                bCurrent = bNext;
            }
        }

        private void WriteMessageString(BigInteger message, StringBuilder output)
        {
            string m = message.ToString();
            int n = m.Length;

            for (int i = 0; i < n; i += 2)
            {
                int value = (m[i] - '0') * 10 + (m[i + 1] - '0');

                if (value == 0)
                    return;

                output.Append((char)value);
            }
        }
    }
}
