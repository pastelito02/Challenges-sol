#Author Grady Congdon
f = open('72')
total, x0 = [int(i) for i in f.readline().split()]
w_len = [int(i) for i in f.readline().split()]
cons = 'bcdfghjklmnprstvwxz'
vowl = 'aeiou'
x_cur = x0
A,C,M = 445, 700001, 2097152
for w in w_len:
    for l in range(w):
        x_next =  (A * x_cur + C ) % M
        x_cur = x_next
        if l % 2 == 0:
            i = x_next % 19
            print(cons[i], end="")
        else:
            j = x_next % 5
            print(vowl[j], end="")
    print(" ", end=" ")
