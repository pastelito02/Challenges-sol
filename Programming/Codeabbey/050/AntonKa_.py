#Author AntonKa_
def solution():
  quantity = int(input())
  for x in range(quantity):
    print(is_palindrome(input()), ' ')


def is_palindrome(data):
  data = data.translate({32: '', 44: '', 45: ''})
  data = data.lower()
  if data[::-1] == data:
    return 'Y'
  else:
    return 'N'


solution()
