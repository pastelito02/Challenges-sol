#Author ky_python
import collections

consonant = "bcdfghjklmnprstvwxz"
vowel = "aeiou"

x = int(raw_input())
funny = []
N = 900000

for i in xrange(N):
    a = 445
    c = 700001
    m = 2097152
    s = False
    result = []

    for j in xrange(6):
        x = ((a * x) + c) % m
        if (s == False):
            result.append(consonant[x%19])
        else:
            result.append(vowel[x%5])
        s = ~s
    funny.append(''.join(result))
    
counter = collections.Counter(funny)
print(counter.most_common(1))