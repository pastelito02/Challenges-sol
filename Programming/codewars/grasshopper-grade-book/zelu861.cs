using System;

public class Kata
{
  public static char GetGrade(int s1, int s2, int s3)
  {
    var s = (s1 + s2 + s3)/3;
    if (60 > s) return 'F';
    if (70 > s) return 'D';
    if (80 > s) return 'C';
    if (90 > s) return 'B';
    return 'A';
 }
}
