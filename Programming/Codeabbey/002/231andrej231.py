#Author 231andrej231
num=int(input())
val=input()
lval = val.split(' ')
sum=0
for i in range(num):
  sum = sum+int(lval[i])
print(sum)
