#Author khlivnyuk
def solution(s):
  return list(map(''.join, zip(*[iter(s + '_')] * 2)))
