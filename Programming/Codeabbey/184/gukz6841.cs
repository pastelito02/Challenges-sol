//Author gukz6841
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CodeAbbey.problems
{
    // Matches Picking
    // Problem #184
    // https://www.codeabbey.com/index/task_view/matches-picking

    public class Problem00184
    {
        public static void Main()
        {
            int cnt = int.Parse(Console.ReadLine());

            for (int i = 0; i < cnt; ++i)
            {
                string[] ss = Console.ReadLine().Trim().Split(' ');

                Console.Write(smSolve(int.Parse(ss[0]), int.Parse(ss[1]), "n" == ss[2]).ToString() + ' ');
            }
        }

        public static int smSolve(int _m, int _k, bool _normal)
        {
            int a = _normal ? 0 : 1;
            int g = _m - ((_m / (_k + 1)) * (_k + 1)) - a;

            if (g <= 0)
            {
                g = _m - (((_m / (_k + 1) - 1)) * (_k + 1)) - a;
            }

            if (g > _k)
            {
                return 0;
            }

            return g;
        }
    }
}
