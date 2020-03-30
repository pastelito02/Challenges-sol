#Author calvinbbcard
import math
for i in range(int(input())):
    distance, angle1, angle2 = [float(i) for i in input().split()]
    pair = 180-angle2
    last = 180-pair-angle1
    side = (distance*math.sin(angle1*(math.pi/180)))/math.sin(last*(math.pi/180))
    print (int(round(side*math.sin(angle2*(math.pi/180)))))
    print (' ')
