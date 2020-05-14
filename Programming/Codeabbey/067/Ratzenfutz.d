//Author Ratzenfutz
import std.conv, std.array, std.bigint, std.stdio, std.algorithm, std.string;

int main()
{
  /* build Fibonacci array */
  BigInt[1_000+1] fibo;
  fibo[0] = BigInt(0); fibo[1] = BigInt(1);
  for (uint k = 2; k <= 1_000; k++) fibo[k] = fibo[k-1] + fibo[k-2];

  /* read number of F */
  string input = readln();
  const uint F = parse!uint(input);

  /* read bigints */
  uint[] index;
  for (uint k = 0; k < F; k++)
  {
    string bigstr = strip(readln());
    const BigInt big = BigInt(bigstr);

    for (uint l = 0; l <= 1000; l++)
      if (fibo[l] == big)
      {
        index ~= l;
        break;
      }
  }

  for (uint k = 0; k < index.length; k++) write(index[k], " ");
  writeln;

  return 0;
}
