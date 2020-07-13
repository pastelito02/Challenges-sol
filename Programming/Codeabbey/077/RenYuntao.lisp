;Author RenYuntao
#!/usr/bin/env python
import math
ans = []
n = int(input())
for i in range(n):
    x1,y1,x2,y2,x,y = (int(j) for j in input().split())
    if x1 == x2:
        if x != x1 and abs((y-y1)-(y-y2)) == abs(y1-y2):
            t1 = math.sqrt((x-x1)**2 + (y-y1)**2)
            t2 = math.sqrt((x-x2)**2 + (y-y2)**2) 
            ans.append(min(t1,t2))
            continue
        elif x != x1 and abs((y-y1)-(y-y2)) != abs(y1-y2):
            d = abs(x-x1)
            ans.append(d)
            continue
        else:
            d = min(abs(y-y1),abs(y-y2))
            ans.append(d)
            continue
    if y1 == y2:
        if y != y1 and abs((x-x1)-(x-x2)) == abs(x1-x2):
            t1 = math.sqrt((x-x1)**2 + (y-y1)**2)
            t2 = math.sqrt((x-x2)**2 + (y-y2)**2) 
            ans.append(min(t1,t2))
            continue
        elif y != y1 and abs((x-x1)-(x-x2)) != abs(x1-x2):
            d = abs(y-y1)
            ans.append(d)
            continue
        else:
            d = min(abs(x-x1),abs(x-x2))
            ans.append(d)
            continue
    k1 = (y2-y1) / (x2-x1)
    b = y1 - k1 * x1
    if y == k1 * x + b:
        ans.append(0)
        continue
    k2 = -(1/k1)
    a = y - k2*x
    m = (k1*(a-b))/(k1*k1+1)
    if (m >= x1 and m <= x2 ) or (m >= x2 and m <= x1):  #The intersection of two lines is on the segment 
        n = k1 * m + b
        d = math.sqrt((x-m)**2 + (y-n)**2)
    else:     #The intersection of two lines is on the segment
        t1 = math.sqrt((x-x1)**2 + (y-y1)**2)
        t2 = math.sqrt((x-x2)**2 + (y-y2)**2) 
        d = min(t1,t2)
    ans.append(d)
print(*ans)