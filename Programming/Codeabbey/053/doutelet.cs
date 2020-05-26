//Author doutelet
using System;
using System.Text;

class Tester
{
    public static void Main()
    {
        int n = int.Parse(Console.ReadLine());
        string res = "";
        string[,] deck = new string[8,8];
        char[] toConvert = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
        int[] k = new int[15];
        for (int asd=0; asd<k.Length; asd++)        {            k[asd] = asd - 7;        }

        for (int line = 0; line < n; line++)
        {
            string[] position = Console.ReadLine().Split(' ');
            int ct = 0;

            StringBuilder kingPos = new StringBuilder(position[0]);
            StringBuilder queenPos = new StringBuilder(position[1]);

            /*converting files position to numbers*/
            for (int i = 0; i < toConvert.Length; i++)
            {
                if (kingPos[0] == toConvert[i]) { kingPos[0] = Convert.ToChar(Convert.ToString(i)); }
                if (queenPos[0] == toConvert[i]) { queenPos[0] = Convert.ToChar(Convert.ToString(i)); }
            }
            position[0] = Convert.ToString(kingPos);
            position[1] = Convert.ToString(queenPos);
            /*---------------------------------------------------*/
            
            /*deck creating*/
            for (int files = 0; files < 8; files++)
            {
                for (int ranks = 0; ranks < 8; ranks++) { deck[files, ranks] = "-"; }
            }
            /*---------------------------------------------------*/

            /*algorithm*/

            StringBuilder kingPos2 = new StringBuilder(position[0]); // 1(b),2
            StringBuilder queenPos2 = new StringBuilder(position[1]); // 3(d),4
            
            
                    if (queenPos2[0] == kingPos2[0]) { ct += 1; }
                    else if (queenPos2[1] == kingPos2[1]) { ct += 1; }
                    
                        for (int ads = 0; ads< k.Length; ads++)
                        {
                            if (queenPos2[0] == kingPos2[0] - k[ads] && queenPos2[1] == kingPos2[1] - k[ads]) { ct += 1; }
                            else if (queenPos2[0] == kingPos2[0] - k[ads] && queenPos2[1] == kingPos2[1] + k[ads]) { ct += 1; }                            
                        }
            if (ct > 0) { res += "Y "; }
            else { res += "N "; }


            /*---------------------------------------------------*/
        }
        Console.Write(res);
        Console.ReadKey();
    }
}