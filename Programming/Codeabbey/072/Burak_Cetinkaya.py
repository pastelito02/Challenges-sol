#Author Burak_Cetinkaya
n = input().split()
List = input().split()
number = int(n[0])
seed = int(n[1])
x = seed
cons = 'bcdfghjklmnprstvwxz'
vow = 'aeiou'
for leng in List:
    word = []
    leng = int(leng)
    i = 0
    while len(word) < leng:
        x = (445 * x + 700001) % 2097152
        if i%2 == 0:
            xi = x%19
            word.append(cons[xi])
            i += 1
        else:
            xi = x%5
            word.append(vow[xi])
            i += 1
    for b in word:
        print(b)
    print(" ")
