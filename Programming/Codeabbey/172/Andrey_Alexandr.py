#Auhtor Andrey_Alexandr
import math
for q in range(int(input())):
    n=input().split()
    d1=int(n[0])
    a=float(n[1])
    b=float(n[2])
    ba=(d1*math.sin(math.radians(a)))/(math.sin(math.radians(b-a)))
    h=ba*math.sin(math.radians(b))
    print(int(h+0.5), end=" ")
