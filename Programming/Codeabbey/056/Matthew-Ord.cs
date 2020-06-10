//Author Matthew Ord
def move(data):
    final = list()
    c = [[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1]]
    for x,w in enumerate(data):
        b = list()
        for y,z in enumerate(w):
            count = 0
            for v in c:
                if -1 < (v[0] + x) < 19 and -1 < (v[1] + y) < 19 and data[v[0] + x][v[1] + y] == "X":
                    count += 1
            if count == 3 and z == "-":
                b.append("X")
            elif not 1 < count < 4 and z == "X":
                b.append("-")
            else:
                b.append(z)
        final.append(b)
    return final
##must allow for expansion in array


start = d = [["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
             ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],]
for x in range(5):
    d.append(["-","-","-","-","-","-"] + [x for x in input()] + ["-","-","-","-","-","-"])
d = d + start
a = list()
print ("go")
for x in range(5):
    d = move(d)
    a.append(str(sum([row.count("X") for row in d])))
print (" ".join(a))