#Author zipiavi4
def play(m,k,type):
    for first in range (0,k+1):
        if type=='n':
            x=(m-first)/(k+1)
        if type=='i':
            x = (m - first-1 ) / (k + 1)
        if x-int(x)==0:
            print(first,end="\t")

            break
fin = open('workfile184')
number1 = int(fin.readline())
# print(number1)
for i in range(number1):
    data = fin.readline()
    weight = data.split()
    m=int(weight[0])
    k=int(weight[1])
    type=weight[2]
    play(m,k,type)