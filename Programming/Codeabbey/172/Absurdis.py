#Author Absurdis
import math

f = open('c.txt')
a = []
t = f.readline()
while (t != ''):
    v = [float(x) for x in t.split()]
    wa = math.tan(math.radians(v[1]))
    wb = math.tan(math.radians(v[2]))
    w = wa * ((wb * v[0]) / (wb - wa))
    a.append(str(int(round(w))))
    t = f.readline()

print (' '.join(a))
