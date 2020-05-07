//Author Ratzenfutz
/*
Problem 75
Dice or Yacht Poker (Yahtzee)
*/

import std.conv, std.string, std.stdio, std.algorithm;

immutable string[] t = ["none", "pair", "two-pairs", "three", "four", "full-house", "small-straight", "big-straight", "yacht"];

int main()
{
  uint throws = readln.strip.to!uint;

  string[] dice;
  for (uint k = 0; k < throws; k++)
  {
    dice ~= readln.strip;
  }

  writeln;
  for (uint k = 0; k < dice.length; k++)
  {
    auto data = dice[k].split.sort;
    if (data.length != 5) { Exception e = new StdioException(""); throw(e); }

    uint value = 0;
    for (uint l = 0; l < data.length; l++)
    {
      uint d = data[l].to!uint;
      value = value * 10 + d;
    }

    /* yacht (yahtzee) */
    if (value % 11111 == 0)
    {
      write(t[8], " "); continue;
    }
    /* big straight */
    if (value == 23456)
    {
      write(t[7], " "); continue;
    }
    /* small straight */
    if (value == 12345)
    {
      write(t[6], " "); continue;
    }
    /* full house */
    if ((value / 100) % 111 == 0)
    {
      if ((value % 100) % 11 == 0)
      {
        write(t[5], " "); continue;
      }
    }
    if ((value % 1000) % 111 == 0)
    {
      if ((value / 1000) % 11 == 0)
      {
        write(t[5], " "); continue;
      }
    }
    /* four of a kind */
    if (((value / 10000) % 1111 == 0) || ((value % 10000) % 1111 == 0))
    {
      write(t[4], " "); continue;
    }
    /* three of a kind */
    if (((value / 100) % 111 == 0) || ((value % 1000) % 111 == 0) || (((value / 10) % 1000) % 111 == 0))
    {
      write(t[3], " "); continue;
    }
    /* two pairs */
    if ((data[0] == data[1]) && (data[2] == data[3]))
    {
      write(t[2], " "); continue;
    }
    if ((data[0] == data[1]) && (data[3] == data[4]))
    {
      write(t[2], " "); continue;
    }
    if ((data[1] == data[2]) && (data[3] == data[4]))
    {
      write(t[2], " "); continue;
    }
    /* one pair */
    if ((data[0] == data[1]) || (data[1] == data[2]) || (data[2] == data[3]) || (data[3] == data[4]))
    {
      write(t[1], " "); continue;
    }
    /* nothing */
    write(t[0], " ");
  }

  writeln;

  return 0;
}
