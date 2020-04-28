#Author flaxferrari
cases = int(input())
while cases:
    fool = [int(x)**2 for x in input().split()]
    print (sum(fool),end=' ')
    cases-=1
