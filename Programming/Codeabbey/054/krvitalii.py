#Author krvitalii
for i in range(int(input())):
  s = int(input())
  e,a,b = 1,1,3
  while (a < b) | (e != 0):
    a += 1
    b,e = divmod((s*s-2*s*a),(2*s-2*a))
  if e == 0: print(a*a + b*b, ' ')
  else: print('Error ')
