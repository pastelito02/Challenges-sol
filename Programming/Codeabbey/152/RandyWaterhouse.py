#Author RandyWaterhouse
import gmpy

f = open("Problem152-input2.txt", "r")
lines = f.readlines()
p = int(lines[0].strip())
q = int(lines[1].strip())
cipher = int(lines[2].strip())
e = 65537
f.close()

n = p * q
phi = n - p - q + 1

d = gmpy.invert(e, phi)
print "d =", d

m = pow(cipher, d, n)
print "m =", m

ms = str(m)
result = ""
for pos in range(0, len(ms), 2):
    pair = ms[pos:pos+2]
    if pair == "00":
        break
    result += chr(int(pair))
print ''.join(result)
