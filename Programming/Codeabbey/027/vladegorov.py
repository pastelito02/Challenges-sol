#Author vladegorov
n = int(raw_input())
ints = [int(x) for x in raw_input().split(' ')]

passes = 0
global_counter = 0
while True:
    counter = 0
    for i in range(len(ints)-1):
        if ints[i]>ints[i+1]:
            ints[i],ints[i+1]=ints[i+1],ints[i]
            counter += 1
    passes += 1
    if counter == 0: break
    global_counter += counter


print passes, global_counter