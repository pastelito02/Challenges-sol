#Author beekeeper
def letters(string):
  return ''.join(filter(str.isalpha, string))

def palindrome(string):
  for i in range(round(len(string)/2)):
    if string[i] != string[-i-1]:
      return 'N '
  return 'Y '

count = int(input())
for i in range(count):
  filtered_string = letters(input())
  print(palindrome(filtered_string.lower()))
