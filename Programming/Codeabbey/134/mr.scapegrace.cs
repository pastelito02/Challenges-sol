//Author mr.scapegrace
using System;
using System.Linq;

namespace Blah
{
  class Program
  {
    static void Main(string[] args)
    {
      string answer = "";
      int[] input = Console.ReadLine().Split(' ').Select(x => Int32.Parse(x)).ToArray();

      int w = input[0], h = input[1], l = input[2];
      Point p = new Point()
      {
        x = 0,
        y = 0
      };
      answer += $" {p.x} {p.y}";
      bool dirX = true, dirY = true;

      for (int z = 0; z < 100; z++)
      {
        if (dirX && (p.x + l) == w)
        {
          dirX = false;
        }
        else if (!dirX && p.x == 0)
        {
          dirX = true;
        }

        if (dirY && (p.y + 1) == h)
        {
          dirY = false;
        }
        else if (!dirY && p.y == 0)
        {
          dirY = true;
        }

        p.x += dirX ? 1 : -1;
        p.y += dirY ? 1 : -1;

        answer += $" {p.x} {p.y}";
      }

      Console.WriteLine(answer.Substring(1));
    }
  }

  class Point
  {
    public int x { get; set; }
    public int y { get; set; }
  }
}
