#Author ThePineapple
#! /usr/bin/python3

import sys
from fractions import gcd

def find_time(x,y,N):
    pages = x + y
    print(f"pages: {pages}")
    seconds = x*y
    print(f"seconds: {seconds}")
    while gcd(pages, seconds) > 1:
        divisor = gcd(pages,seconds)
        pages /= divisor
        seconds /= divisor
    print("after gcd:")
    print(f"pages: {pages}")
    print(f"seconds: {seconds}")
    sec1 = (N // pages) * seconds
    print(f"sec1: {sec1}")
    nRemainder = N % pages
    print(f"remainder: {nRemainder}")
    sec2 = 0
    if nRemainder > 0:
        sec2 = naive_search(x,y,nRemainder)
        print(f"naive search was called for {x}, {y}, and {N}")
    return int(sec1 + sec2)

def naive_search(x,y,N):
    Xiter, Yiter = x, y
    timeList = []
    while len(timeList) < N:
        timeList.append(min(Xiter, Yiter))
        if timeList[-1] == Xiter:
            Xiter += x
        elif timeList[-1] == Yiter:
            Yiter += y
    return timeList[-1]

file = open("printerinput.txt")
cases = int(file.readline().strip())
answers = []

for i in range(cases):
    x, y, N = [int(x) for x in file.readline().strip().split()]
    answers.append(find_time(x,y,N))

for x in answers:
    print(str(x), end=" ")