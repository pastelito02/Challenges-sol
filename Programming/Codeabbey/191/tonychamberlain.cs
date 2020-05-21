//Author tonychamberlain
using System;

public class Spaceship
{
    private static void Main()
    {
        int length = int.Parse(Console.ReadLine());
        for(int i=0;i<length;++i)
        {
            string line = Console.ReadLine();
            Console.Write("{0} {1} ",GetSmallest(line),GetLargest(line));
        }
    }
    
    private static string GetLargest(string s)
    {
        char[] sorted = s.ToCharArray();
        char[] unsorted = s.ToCharArray();
        Array.Sort(sorted);
        Array.Reverse(sorted);
        
        int i = 0;
        while (sorted[i] == unsorted[i])
            i++;
        int index = Array.LastIndexOf(unsorted,sorted[i]);
        char c = unsorted[i];
        unsorted[i] = unsorted[index];
        unsorted[index] = c;
        
        return new string(unsorted);
    }
   private static string GetSmallest(string s)
        {
            char[] sorted = s.ToCharArray();
            Array.Sort(sorted);
            char[] unsorted = s.ToCharArray();

            int smallest = 0;
            while (sorted[smallest] == '0')
                ++smallest;

            if (unsorted[0] > sorted[smallest])
            {
                int index = Array.LastIndexOf(unsorted, sorted[smallest]);
                char temp = unsorted[0];
                unsorted[0] = unsorted[index];
                unsorted[index] = temp;
                return new string(unsorted);
            }
            else
            {
                char temp = sorted[0];
                sorted[0] = sorted[smallest];
                sorted[smallest] = temp;
            }
            smallest = 1;
            bool done = false;
            for (int i = 1; !done && i < sorted.Length; ++i)
            {
                if (unsorted[i] > sorted[smallest])
                {
                    int index = Array.LastIndexOf(unsorted, sorted[smallest]);
                    char temp = unsorted[i];
                    unsorted[i] = unsorted[index];
                    unsorted[index] = temp;
                    done = true;
                }
                else
                    smallest++;
            }

            return new string(unsorted);

        }
}