#Author cn3089
def padto5(astr):
    astr += str(5 - len(astr) % 5)*(5 - len(astr) % 5)
    return astr

def removepadding(astr):
    padding = int(astr[-1]) * -1
    return astr[:padding]

def encodechar(argn):
    if argn < 26:
        return chr(argn + 65)
    return str(argn - 24)

def decodechar(argc):
    if 65 <= ord(argc) <= 90:
        return ord(argc) - 65
    return int(argc) + 24

def tobase32(astr):
    astr = padto5(astr)
    returning = ''
    for i in range(int(len(astr)/5)):
        chop = astr[i*5:i*5+5]
        chop = list(map(ord, chop))
        chopnum = 0
        for j in range(4, -1, -1): #4 3 2 1 0
            chopnum += chop[4-j] << (j*8)
        for j in range(8):
            returning += encodechar((chopnum >> (5*(7-j))) % 32)
    return returning

def frombase32(astr):
    returning = ''
    for i in range(int(len(astr)/8)):
        tobin = 0
        chop = astr[i*8:i*8+8]
        for j in range(8):
            tobin += decodechar(chop[j]) << (5*(7-j))
        for j in range(5):
            returning += chr((tobin >> 8*(4-j)) % 256)
    return removepadding(returning)

g = open('206output.txt', 'w')
with open('206input.txt', 'r') as f:
    coun = 0
    for line in f:
        if line[-1] == "\n":
            nonew = line[:-1]
        else:
            nonew = line
        coun += 1
        if coun != 1:
            if coun % 2 == 0:
                g.write(tobase32(nonew) + ' ')
            else:
                g.write(frombase32(nonew) + ' ')
g.close()
