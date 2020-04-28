#Author Maksym_Soia
n,x0=map(int,input().split())
a=list(map(int,input().split()))
sa="aeiou"
sb="bcdfghjklmnprstvwxz"
A=445
C=700001
M=2097152
for x in a:
    for i in range(x):
        x0=(A*x0+C)%M
        if i%2:
            print(sa[x0%5],end='')
        else:
            print(sb[x0%19],end='')
    print(' ',end='')
print()
