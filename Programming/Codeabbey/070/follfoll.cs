//Author follfoll
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;

static class Program
{
    static string[] words;
    static void Main()
    {
        words = File.ReadAllLines("generatedWords.txt").ToArray();
        GetResults();
        Console.ReadKey(true);
    }
    static void GetResults()
    {
        var d = new Dictionary<string, int>(); var word = string.Empty; var num = 0;
        foreach (var item in words)
        {
            if (d.ContainsKey(item)) d[item]++;
            else d.Add(item, 1);
            if (d[item] > num)
            {
                num = d[item];
                word = item;
            }
        }
        Console.WriteLine(word);
    }
}