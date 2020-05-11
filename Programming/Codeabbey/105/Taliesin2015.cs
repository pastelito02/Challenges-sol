//Author Taliesin2015
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace CodeAbbey
  {
  class Program
    {
    static void Main (string [] args)
      {
      try
        {
        if (args.Length == 0)
          Trace.WriteLine ("Parameter(s) missing");
        else
          {
          long count = Convert.ToInt32 (args [0]);
          long [,] coordinates = new long [count, 2];
          long[] pivot = new long[] {0, 0};
          long[] min = new[] {long.MaxValue, long.MaxValue};
          long[] max = new[] {long.MinValue, long.MinValue};

          for (int i = 0; i < count; i++)
            for (int j = 0; j < 2; j++)
              {
              coordinates [i, j] = Convert.ToInt32 (args [i * 2 + j + 1]);
              min [j] = coordinates [i, j] < min [j] ? coordinates [i, j] : min [j];
              max [j] = coordinates [i, j] > max [j] ? coordinates [i, j] : max [j];
              }

          // Determine pivot coordinates
          for (int j = 0; j < 2; j++)
            pivot [j] = (long) Math.Round ((double) (min [j] + max [j]) / 2);

          // Calculate area for triangle "first point -> last point -> pivot" first
          double result = (coordinates [0, 0] - pivot [0]) * (coordinates [count - 1, 1] - coordinates [0, 1]);
          double temp   = (coordinates [0, 0] - coordinates [count - 1, 0]) * (pivot [1] - coordinates [0, 1]);
          result -= temp;
          double area = Math.Abs (result) / 2;

          // Calculate remaining area for the remaining triangles
          for (int i = 0; i < count - 1; i++)
            {
            result = (coordinates [i, 0] - pivot [0]) * (coordinates [i + 1, 1] - coordinates [i, 1]);
            temp   = (coordinates [i, 0] - coordinates [i + 1, 0]) * (pivot [1] - coordinates [i, 1]);
            result -= temp;
            area += Math.Abs (result) / 2;
            }

          Trace.WriteLine (area.ToString().Replace (',', '.'));
          }
        }
      catch (Exception ex)
        {
        Trace.WriteLine ("Exception: " + ex.Message);
        }
      }
    }
  }
