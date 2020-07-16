/*Uemoe*/
using System.Linq;
using System.Collections.Generic;

public class Kata
{
  public static List<int> FindMultiples(int num, int limit) =>
     Enumerable.Range(1, limit / num)
               .Select(x => x * num)
               .ToList();
 }
