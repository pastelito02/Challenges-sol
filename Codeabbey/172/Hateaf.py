#Author Hateaf
import math
num = int(input())

for i in range(num):
    D1,a,b=map(float, input().split())
    H=math.tan(a*math.pi/180)*D1 / (1-(math.tan(a*math.pi/180) /math.tan(b*math.pi/180)))
    print(int(round(H))," ")
