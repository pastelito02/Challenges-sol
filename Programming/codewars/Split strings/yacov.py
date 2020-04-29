#Author yacov
def solution(s):
  return ['{:2}'.format(s[x:x+2]).replace(' ','_') for x in range(0,len(s),2)]
