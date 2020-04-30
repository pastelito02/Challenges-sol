//Author Ratzenfutz
import std.conv, std.math, std.string, std.stdio;

double area(in double a, in double b, in double c)
{
  return sqrt(4 * a^^2 * b^^2 - (a^^2 + b^^2 - c^^2)^^2) / 4;
}

int main()
{
  uint cases = readln.strip.to!uint;

  double[] A;
  for (uint k = 0; k < cases; k++)
  {
    auto coord = readln.strip.split;
    double x1 = coord[0].to!double;
    double y1 = coord[1].to!double;
    double x2 = coord[2].to!double;
    double y2 = coord[3].to!double;
    double x3 = coord[4].to!double;
    double y3 = coord[5].to!double;
    double side_a = sqrt((x2 - x1)^^2 + (y2 - y1)^^2);
    double side_b = sqrt((x3 - x1)^^2 + (y3 - y1)^^2);
    double side_c = sqrt((x3 - x2)^^2 + (y3 - y2)^^2);
    A ~= area(side_a, side_b, side_c);
  }

  writeln;
  for (uint k = 0; k < A.length; k++) writef("%0.10g ", A[k]);
  writeln;

  return 0;
}
