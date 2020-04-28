#Author ahmose231
def calculate(p,a):
  x=p-a
  return ((x*x) - (a*a)) / (2*x)

t=input()
t=int(t)
r=[]
for i in range(t):
  r.append(int(input()))
for i in range(t):
  for j in range(1,int(r[i]/2)):
    m=calculate(r[i],j)
    if(m==int(m)):
      c=r[i]-j-m
      print(int(c*c),end=" ")
      break
