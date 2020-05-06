//Author Ratzenfutz
import std.conv, std.array, std.string, std.stdio;

int main()
{
  /* read number of test cases */
  uint cases = readln.strip.to!uint;

  /* process cases */
  uint[] rem;
  for (uint k = 0; k < cases; k++)
  {
    auto pair = readln.strip.split;

    rem ~= ((pair[0].to!ulong) % 6) + ((pair[1].to!ulong) % 6) + 2;
  }

  writeln;
  for (uint k = 0; k < rem.length; k++) write(rem[k], " ");
  writeln;

  return 0;
}
