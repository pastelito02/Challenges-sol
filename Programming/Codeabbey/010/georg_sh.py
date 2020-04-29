#Author georg_sh
import sys
l=int(input())
for i in range(l):
  x1,y1,x2,y2=[int(x) for x in input().split()]
  a = (y2-y1)/(x2-x1)
  b = y1-a*x1
  sys.stdout.write("("+str(a)+" "+str(b)+") ")
