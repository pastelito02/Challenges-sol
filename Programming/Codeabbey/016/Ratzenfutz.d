//Author Ratzenfutz
import std.array, std.conv, std.stdio, std.algorithm;

int main()
{
  /* read number of cases from stdin */
  string input = readln();
  uint cases = parse!uint(input);

  /* repeatedly read from stdin and calculate avg. */
  uint[] avg;
  for (uint k = 0; k < cases; k++)
  {
    auto c = split(readln());
    uint[] items;
    for (uint l = 1; l < c.length; l++) items ~= parse!uint(c[l-1]);

    uint num = reduce!"a+b"(items);
    uint denom = items.length & 0xffffffff;
    uint ratio;
    /* use assembly due to rounding errors */
    asm
    {
      fild    num;
      fidiv   denom;
      fistp   ratio;
    }
    avg ~= ratio;
  }

  for (uint k = 0; k < avg.length; k++) write(avg[k], " ");
  writeln;

  return 0;
}
