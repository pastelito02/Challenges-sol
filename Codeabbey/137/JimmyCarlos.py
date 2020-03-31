#Author JimmyCarlos
def goDownTheRabbitHole(A_start):
    global A
    totalSum = sum([a[1] for a in A_start])
    target = totalSum/2
    A_left, A_right = [],[]
    currentSum = 0
    currentIndex = 0
    while True:
        if abs(currentSum - target) <= abs(currentSum+A_start[currentIndex][1] - target):
            break
        A_left.append(A_start[currentIndex][:])
        A[A_start[currentIndex][4]][3] += "O"
        currentSum += A_start[currentIndex][1]
        currentIndex += 1
    for i in range(currentIndex,len(A_start)):
        A_right.append(A_start[i][:])
        A[A_start[i][4]][3] += "I"
    if len(A_left) > 1:
        goDownTheRabbitHole(A_left[:])
    if len(A_right) > 1:
        goDownTheRabbitHole(A_right[:])



##S = "ABRACADABRA"
S = input()

A = sorted([[i,S.count(i),ord(i),""] for i in set(S)], key=lambda x:(-x[1],x[0]))
# A = letter, count, byte, code, uniqueID

for i in range(len(A)):
    A[i].append(i)

goDownTheRabbitHole(A)

answer = []
for i in range(len(A)):
    answer.append(str(A[i][2]))
    answer.append(A[i][3])

print(" ".join(answer))
