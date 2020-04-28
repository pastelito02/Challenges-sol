#Author benjamin_duguay
nbValue = int(input())
values = input().split()
sum = 0

for i in range(0, nbValue):
  sum += int(values[i])

print(sum)
