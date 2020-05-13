#Author ornithion
#!/usr/local/bin/python3
def genfib(x):
  if x == 0 or x == 1:
    return x
  f1, f2 = 0, 1
  f2 = 1
  for i in range(x):
    f = f1 + f2
    f1, f2 = f2, f
  return f

f = open('input.txt', 'r')
n = int(f.readline())

num = [int(x) for x in f.readline().split()]
for i in range(n):
  index = 1
  while genfib(index) % num[i] != 0:
    index += 1
  print(index + 1, end=" ")

f.close()
