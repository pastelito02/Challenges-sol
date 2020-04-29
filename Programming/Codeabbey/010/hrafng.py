#Author hrafng
n = int(input())

results = []
while n:
  x1, y1, x2, y2 = [int(i) for i in input().split()]
  a = (y2 - y1) / (x2 - x1)
  b = y1 - x1 * a
  results.append("(%s %s)" % (a, b))
  n -= 1
print (" ".join(results))
