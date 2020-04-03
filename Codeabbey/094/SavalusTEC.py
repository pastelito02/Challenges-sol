#Author SavalusTEC

count = int(input(""))
results = []
for i in range(0, count):
    s = 0
    values = map(int, input("").split(" "))
    for v in values:
        s = s+v**2
    results.append(s)
for r in results:
    print(r, end=" ")
