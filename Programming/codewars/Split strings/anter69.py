#Author anter69
import re

def solution(s):
  return re.findall(".{2}", s + "_")
