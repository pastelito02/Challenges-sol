#author agraham943
import math

def main():
  triangle()

def triangle():
  readout = open('lines.txt')
  result = []
  for line in readout.readlines():
    v = line.split()
    values = []
    for x in v:
      values.append(int(x))
    (x1,y1,x2,y2,x3,y3) = values
    a = math.sqrt((x2-x1)**2+(y2 - y1)**2)
    b = math.sqrt((x3-x2)**2 + (y3-y2)**2)
    c = math.sqrt((x3-x1)**2 + (y3-y1)**2)
    s = (a + b + c)/2
    A = math.sqrt(s*(s-a)*(s-b)*(s-c))
    result.append(A)

  for j in result:
    print(j,end = " ")





if __name__ == "__main__": main()
