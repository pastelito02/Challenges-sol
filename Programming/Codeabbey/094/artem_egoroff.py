#Author artem_egoroff
data = """5 10 13 15 19
4 9
2 6 10
5 7 10 12 15 20 23
2 4 6 9 14 17 21
1 4 6
4 6 9 14 19 21 23
4 9 11
5 8 12 15 18
1 5
2 4 6
5 8 13 15 18 22
4 6 10 14 16 20 25
3 8 11 14 17 19 24
2 7 10 14 16 19
5 7 12 17 20"""
data = data.splitlines()

for stroka in data:
    digits = stroka.split()
    t = [int(x)**2 for x in digits]
    print(sum(t),end = " ")
