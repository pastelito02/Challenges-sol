#Author brazofuerte
# given x and y, return a and b if y(x) = ax + b

count = int(input())

i = 0
A = ''

while i < count:
  f = map(int, input().split())
  x1 = f[0]
  y1 = f[1]
  x2 = f[2]
  y2 = f[3]

# y1 = ax1 + b
# y2 = ax2 + b
# y1 - y2 = a(x1 - x2)
  a = (y1 - y2) / (x1 - x2)

# 2b = y1 + y2 - a(x1 + x2)
  b = 0.5 * (y1 + y2 - a*(x1 + x2))
  b = int(b)

  A = A + '(' + str(a) + ' ' + str(b) + ')' + ' '

  i += 1
print (A)
