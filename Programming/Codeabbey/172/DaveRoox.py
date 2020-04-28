#Author DaveRoox
from math import pi, tan
rad = lambda x: pi * x / 180
for i in range(int(input())):
    D1, A, B = map(float, input().split())
    tan_a, tan_b = tan(rad(A)), tan(rad(B))
    D2 = D1 * tan_a / (tan_b - tan_a)
    print(round(D2 * tan_b), end=' ')
