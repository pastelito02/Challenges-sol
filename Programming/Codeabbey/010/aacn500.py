#Author aacn500
def lin(x1, y1, x2, y2):
  a = (y1 - y2) / (x1 - x2)
  b = y1 - (x1 * a)
  return a, b

N = int(input())
for n in range(N):
  inp = input().split()
  a, b = lin(int(inp[0]), int(inp[1]), int(inp[2]), int(inp[3]))
  print ('(' + str(a) + ' ' + str(b) + ')',)
