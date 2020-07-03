#Author minkika
uinput = int(input())

final = []
for i in range(uinput):
    result = []
    inputs = list(map(int, input().split(' ')))
    start = inputs[0]*86400+inputs[1]*3600+inputs[2]*60+inputs[3]
    stop = inputs[4]*86400+inputs[5]*3600+inputs[6]*60+inputs[7]
    lengh = stop - start
    result.append(lengh % 60)
    lengh = lengh // 60
    result.append(lengh % 60)
    lengh = lengh // 60
    result.append(lengh % 24)
    result.append(lengh // 24)
    result = list(reversed(result))
    final.append('(' + ' '.join(map(str, result)) + ')')
print(' '.join(final))