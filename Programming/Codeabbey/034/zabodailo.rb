#Author zabodailo
import math
import decimal

decimal.getcontext().prec=20
n=int(input())

def y(x):
  return((a*x)+(b*decimal.Decimal(math.sqrt(decimal.Decimal(math.pow(x,3)))))-decimal.Decimal(c*decimal.Decimal(math.exp(decimal.Decimal(-x/50))))-d)

for i in range(n):
  a,b,c,d=[decimal.Decimal(s) for s in input().split()]
  x=step=decimal.Decimal(100)
  t=y(x)
  counter=0
  while decimal.Decimal(t).quantize(decimal.Decimal("0.00000001"))!=0:
    step=decimal.Decimal(step/2)
##        print(x,t)
    if t>0:
      x-=step
    else:
      x+=step
    t=y(x)
    counter+=1
    if counter==1000:
      break
  print(x,end=" ")
