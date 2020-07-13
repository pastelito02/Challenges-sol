#Author IanIsTrying
import math
def distance_of_2points(p1, p2):
    return math.sqrt((p1[0]-p2[0])**2 + (p1[1]-p2[1])**2)

def distance_of_line(x1, y1, x2, y2, x, y):
    cross = (x2 - x1)*(x - x1) + (y2 - y1)*(y - y1)  #distance of AP
    print 'cross', cross
    p1 = x1, y1
    p = x, y
    print 'x,y', x, y
    if cross <= 0:
        return distance_of_2points(p1, p)
    d2 = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1)
    p2 = x2, y2
    p = x, y
    print 'd2', d2
    if cross >= d2:
        return distance_of_2points(p, p2)
    r = cross / float(d2)
    print 'r', r
    px = x1 + (x2 - x1)*r
    py = y1 + (y2 - y1)*r
    xp = px, py

    return distance_of_2points(xp, p)



def point_to_segment_distance(data):
    result = ''
    data = [item.replace('\n','') for item in data]
    for item in data:
        list_ = [int(it) for it in item.split()]
        x1, y1 = list_[0], list_[1]
        x2, y2 = list_[2], list_[3]
        xp, yp = list_[4], list_[5]
        result += str(distance_of_line(x1, y1, x2, y2, xp, yp )) + ' '
    return result

if __name__ == "__main__":
    infile = open('test.txt', 'r')
    data = infile.readlines()
    print point_to_segment_distance(data)
