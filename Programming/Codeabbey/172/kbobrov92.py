#Author kbobrov92
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  1 16:15:23 2019

@author: Konstantin
"""
import math
# cloud attidute measurment
string="""944 31.5215 55.3850
1424 37.3525 61.1927
1584 26.4541 58.5991
685 31.0638 58.1747
1044 25.2532 65.7913
2244 29.1925 59.4662
1386 25.2507 64.8153
1075 30.4683 54.6274
410 36.5411 51.3215
883 36.9354 53.8594
2330 29.4656 65.7790
1562 31.0663 63.9003
2802 24.3475 53.5071
2240 23.0535 64.3605
892 22.1201 52.3738"""
n=15
#H   =   tan(B) * D2
#H   =   tan(A) * (D1 + D2)   =   tan(A) * D1  +  tan(A) * D2'
#we have D1, A and B
#equations to solve:
# D2=(tan(a)D1)/(tanB-tanA)
#H=tanb D1
for i in range(n):
    s=string.split("\n")
for i in range(n):
    s[i]=s[i].split(" ")
    for j in range(len(s[i])):
        if j==0:
            s[i][j]=int(s[i][j])
        else:
            s[i][j]= float(s[i][j])
D2=[[] for x in range(n)]
H=[[] for x in range(n)]
for i in range(n):
    D2[i]=(math.tan(math.radians(s[i][1]))*s[i][0])/(math.tan(math.radians(s[i][2]))-math.tan(math.radians(s[i][1])))
    H[i]=round(math.tan(math.radians(s[i][2]))*D2[i])
for i in range(n):
    print(f"{H[i]} ")
