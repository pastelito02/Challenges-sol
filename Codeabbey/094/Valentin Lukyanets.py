#Author Valentin Lukyanets
def f(l):
    s = 0
    for i in l:
        w = int(i)
        s += w**2
    return s

n = input('')

for i in range(n):
    s = raw_input('')
    print f(s.split()),
