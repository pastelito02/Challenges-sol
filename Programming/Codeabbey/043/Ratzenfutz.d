//Author Ratzenfutz
import std.conv, std.array, std.stdio, std.string;

immutable float _1 = 1.0;
immutable float _6 = 6.0;

int main()
{
  /* read number of items from stdin */
  int items = readln.strip.to!int;

  /* read numbers from stdin and convert */
  uint[] dice;
  for (uint k = 0; k < items; k++)
  {
    double p = readln.strip.to!double;
    uint q;
    /* process with asm */
    asm
    {
      fld     p;
      fmul    _6;
      fadd    _1;
      fisttp  q;
    }
    dice ~= q;
  }

  writeln;
  for (uint k = 0; k < dice.length; k++) write(dice[k], " ");
  writeln;

  return 0;
}
