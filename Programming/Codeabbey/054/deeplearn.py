#Author deeplearn
import math
sq2 = math.sqrt(2)
l=int(input())
for i in range(l):
  s=int(input())
  for c in range(int(math.ceil(s*sq2/(2+sq2))), s):
    angle = math.asin(float(s-c)/(c*sq2))-math.pi/4.0
    found = False
    for a in range(int(c*math.sin(angle))-1,int(c*math.sin(angle))+2):
      b=s-a-c
      if a**2+b**2 == c**2 and a>0 and b>0:
        print (c**2),
        found = True
        break
    if found:
      break
