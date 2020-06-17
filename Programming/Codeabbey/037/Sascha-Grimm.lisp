;Author Sascha Grimm
def getData(fname, dtype=str):
    with open(fname,"r") as f:
        return [map(float,line.strip().split()) for line in f.readlines()][0]

def solve(p,r,l):
    for m in xrange(1000,int(p)):
        if mortgage(p,r,m,l) == l:
            return m

def mortgage(p,r,m, max):
    interest = 1+r/100./12.
    month = 0
    while p > 0:
        month += 1
        p = p*interest-m
        if month > max:
            return -1
    return month

print solve(*getData("037.txt"))
