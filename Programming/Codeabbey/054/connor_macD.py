#Author connor_macD
t = int(input())
ret = ""
while t > 0:
  t -= 1
  s = int(input())
  ss = s*s
  s2 = 2*s
  a = 2
  while (ss-s2*a)%(s2-2*a) != 0:
    a += 1
  ret += str(int(s-a-((s*s-2*s*a)/(2*s-2*a)))**2)+" "
print(ret[:-1])
