//Author GlideThestral
using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.IO;
using System.Numerics;

namespace abbey {
  class Program{
    static void Main(string[] args) {
      int nt=int.Parse(Console.ReadLine());
      for(int u=0;u<nt;u++) {
        string[] ps=Console.ReadLine().Split(' ');
        int N=int.Parse(ps[0]),K=int.Parse(ps[1]);
        long M=long.Parse(ps[2]);

        string alf="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        int p=0;
        while(K>0) {
          long s=Comb(N-1,K-1);
          if(M>=s) {
            M-=s; N--; p++;
          } else {
            Console.Write(alf[p++]);
            N--; K--;
          }
        }
        Console.WriteLine();
      }
    }

    private static long Comb(int n,int k) {
      long res=1;
      for(int i=1;i<=k;i++) res=res*(n+1-i)/i;
      return res;
    }

  }
}
