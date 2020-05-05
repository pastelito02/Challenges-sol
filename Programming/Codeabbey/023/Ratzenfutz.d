//Author Ratzenfutz
import std.conv, std.string, std.stdio;

int main()
{
  auto data = readln.strip.split;

  uint[] arr;
  for (uint k = 0; k < data.length; k++)
  {
    if (data[k] != "-1") arr ~= data[k].to!uint;
  }

  uint swaps = 0;
  for (uint k = 0; k < (arr.length - 1); k++)
  {
    if (arr[k] > arr[k+1])
    {
      swaps++;
      uint t = arr[k];
      arr[k] = arr[k+1];
      arr[k+1] = t;
    }
  }

  uint result = 0;
  for (uint k = 0; k < arr.length; k++)
  {
    result += arr[k];
    result *= 113;
    result %= 10_000_007;
  }

  writeln(swaps, " ", result);

  return 0;
}
