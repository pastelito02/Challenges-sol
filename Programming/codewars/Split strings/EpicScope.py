#Author EpicScope
def solution(s):
  if len(s) == 0:
    return []
  elif len(s) == 1:
    return [s + "_"]
  else:
    return [s[:2]] + solution(s[2:])
