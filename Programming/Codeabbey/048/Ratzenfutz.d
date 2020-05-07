//Author Ratzenfutz
import std.array, std.conv, std.stdio;

uint collatz(in uint n)
{
  uint steps = 0;

  uint m = n;
  while (m > 1)
  {
    steps++;
    if ((m & 1) == 0)
      m >>= 1;
    else
      m = 3*m + 1;
  }

  return steps;
}

int main()
{
  /* read from stdin */
  string input = readln();
  uint i = parse!uint(input);

  /* read from stdin and repeatedly retrieve cycle length */
  uint[] seq;
  auto coll = split(readln());
  for (uint k = 0; k < i; k++)
  {
    uint c = parse!uint(coll[k]);
    seq ~= collatz(c);
  }

  for (uint k = 0; k < seq.length; k++) write(seq[k], " ");
  writeln;

  return 0;
}
