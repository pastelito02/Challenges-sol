#Author nerothtr
test_case = int(input())

for i in range(test_case):
  x1, y1, x2, y2 = [int(x) for x in input().split()]

  x = x1 - x2
  y = y1 - y2
  a = y // x
  b = y1 - (a * x1)

  print('(%d %d)' % (a, b), end = ' ')
