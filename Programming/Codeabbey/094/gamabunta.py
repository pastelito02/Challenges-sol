#Author gamabunta

data = [map(int, e.split()) for e in '''
3 8
4 7 11 13 16
4 7 9 13 15 18
3 6 8 10 14
2 4 6 10 12
1 6
4 9 14
2 5 9 13
2 4 7
1 6 10 14 16 21 25
3 5 10 14 18 23
4 9 14 17 21 26
5 8 12 16 19 24 28
5 10 14 18 21 25
1 4 9
2 5 10
1 5
1 3 6 11 13 16 18
'''.strip().split('\n')]


for xs in data:

    print sum(x * x for x in xs),
