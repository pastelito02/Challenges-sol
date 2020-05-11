;Author george_giudice
from math import sqrt

def trianArea(coordsA,coordsB,coordsC):
  x1,y1 = coordsA
  x2,y2 = coordsB
  x3,y3 = coordsC
  a= sqrt((x1-x2)**2 + (y1-y2)**2)
  b= sqrt((x2-x3)**2 + (y2-y3)**2)
  c= sqrt((x3-x1)**2 + (y3-y1)**2)
  s=(a+b+c)/2.0
  area = sqrt(s * (s-a) * (s-b) * (s-c))
  return area

listPoints=[]
for _numPoints in range(int(input())):
  listPoints += [tuple(map(int, input().split()))]
listTrian = []
for b in range(1,len(listPoints) - 1):
  listTrian += [(listPoints[0],listPoints[b],listPoints[b+1])]
areaTot =0
for tupCoor in listTrian:
  areaTot += trianArea(*tupCoor)
print(round(areaTot,3))
