//Author Ratzenfutz
import std.conv, std.stdio, std.string, std.bigint;

int main()
{
  uint cases = readln.strip.to!uint;

  auto denom = readln.strip.split;

  uint[] index;
  for (uint k = 0; k < denom.length; k++)
  {
    BigInt[] F; F ~= BigInt(0); F ~= BigInt(1);
    BigInt d = BigInt(denom[k]);
    for (uint i = 1; ; i++)
    {
      if (F[i] % d == 0)
      {
        index ~= i;
        break;
      }
      F ~= F[i] + F[i-1];
    }
  }

  writeln;
  for (uint k = 0; k < index.length; k++) write(index[k], " ");
  writeln;

  return 0;
}
