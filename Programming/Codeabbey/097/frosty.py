#Author frosty
from collections import namedtuple

Mammal = namedtuple('Mammal', 'legs breasts')
girl = Mammal(2, 2)
pig = Mammal(4, int)

out = []
for _ in range(int(input())):
  legs, breasts = map(int, input().split())
  solutions = 0
  for girls in range(1, legs//2+1):
    remaining_legs = legs - girl.legs * girls
    remaining_breasts = breasts - girl.breasts * girls
    if remaining_legs % 4 != 0:
      continue
    else:
      pigs = remaining_legs // 4
      if pigs > 0 and (remaining_breasts / pigs) % 2 == 0:
        solutions += 1

  out.append(solutions)

print(*out)
