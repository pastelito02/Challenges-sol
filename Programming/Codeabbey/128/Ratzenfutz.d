//Author Ratzenfutz
import std.conv, std.array, std.string, std.stdio;

T binomial(T)(in T n, in T k)
{
  T n1 = n;      /* local variables */
  T k1 = k;

  if (k1 > n1) return T(0);

  if (k1 > (n1 - k1)) k1 = n1 - k1;

  T res = 1;
  T l = 0;

  while (l < k1)
  {
    res = res * (n1 - l);
    l += 1;
    res = res / l;
  }

  return res;
}

int main()
{
  uint cases = readln.strip.to!uint;

  ulong[] C;
  for (uint j = 0; j < cases; j++)
  {
    auto nk = readln.split;
    ulong N = nk[0].to!ulong;
    ulong K = nk[1].to!ulong;
    C ~= binomial(N, K);
  }

  writeln;
  for (uint j = 0; j < C.length; j++) write(C[j], " ");
  writeln;

  return 0;
}
