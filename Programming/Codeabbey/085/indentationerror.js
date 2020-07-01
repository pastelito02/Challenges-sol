//Author indentationerror
import math
from operator import itemgetter
temp = input().split()
n = int(temp[0])
angle = float(temp[1])
angle = (angle*math.pi/180)
sol = []
k = n
while k!=0:
    temp = input().split(' ')
    x = int(temp[1])*math.cos(angle) - int(temp[2])*math.sin(angle)
    y = int(temp[1])*math.sin(angle) + int(temp[2])*math.cos(angle)
    x_1 = x%1
    y_1 = y%1
    if x_1<0.5:
        x = math.floor(x)
    else:
        x = math.ceil(x)
    if y_1 <0.5:
        y = math.floor(y)
    else:
        y = math.ceil(y)
    var =[]
    var.append(temp[0])
    var.append(x)
    var.append(y)
    sol.append(var)
    k = k-1
sol.sort(key=itemgetter(2))
sol_string =[]
while k!=n:
    sol_string.append(sol[k][0])
    k = k+1
print(" ".join(sol_string))
