#Author bchaparro
n=int(input())
m=[]
for i in range(0,n):
    m.append(input().split())
    suma=0
    for j in range(0,len(m[i])):
        m[i][j]=int(m[i][j])
        suma+=((m[i][j])**2)
    print(suma,end=" ")
