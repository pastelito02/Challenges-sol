;Author tarensanders
ins = list(input().split())
ins.pop(0)
result=[]

for x in range(0,len(ins),2):
  a = ins[x+1][int(ins[x]):]+ins[x+1][:int(ins[x])]
  result.append(a)



print(*result)