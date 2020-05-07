//Author smarrog
using System;
using System.Collections.Generic;
using System.Linq;

public class Example {
  public static void Main() {
    var n = int.Parse(Console.ReadLine());
    for (var i = 0; i < n; ++i) {
      findPosition(Console.ReadLine());
    }
  }

  static void findPosition(string path) {
    var x = 0.0;
    var y = 0.0;
    foreach (var step in path) {
      switch (step) {
        case 'A':
          x += 1;
          break;
        case 'B':
          x += Math.Cos(Math.PI / 3);
          y += Math.Sin(Math.PI / 3);
          break;
        case 'C':
          x -= Math.Cos(Math.PI / 3);
          y += Math.Sin(Math.PI / 3);
          break;
        case 'D':
          x -= 1;
          break;
        case 'E':
          x -= Math.Cos(Math.PI / 3);
          y -= Math.Sin(Math.PI / 3);
          break;
        case 'F':
          x += Math.Cos(Math.PI / 3);
          y -= Math.Sin(Math.PI / 3);
          break;
      }
    }
    double distance = Math.Sqrt(x * x + y * y);
    Console.WriteLine(distance + " ");
  }
}
