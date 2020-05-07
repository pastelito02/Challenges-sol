//Author Ratzenfutz
/*
Problem 127
Anagrams
*/

import std.algorithm, std.string, std.stdio, std.array, std.conv;

immutable string filename = "problem127.txt";

int main()
{
  string[] temporary;

  /* read from source, sort entry, write to temp */
  File anagrams = File(filename, "r");

  while (!anagrams.eof())
  {
    temporary ~= array(anagrams.readln.strip).sort.to!string;
  }

  anagrams.close();

  /* work with sorted temp */
  temporary.sort;

  uint words = readln.strip.to!uint;

  uint[] shuffle;
  for (uint k = 0; k < words; k++)
  {
    string w = array(readln.strip).sort.to!string;

    int p = countUntil(temporary, w);
    if (p >= 0)
    {
      uint a = 0;
      while (temporary[p] == w)
      {
        a++; p++;
      }
      shuffle ~= (a - 1);
    }
    else
      shuffle ~= 0;
  }

  writeln;
  for (uint k = 0; k < shuffle.length; k++) write(shuffle[k], " ");
  writeln;

  return 0;
}
