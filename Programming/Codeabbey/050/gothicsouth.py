#Author gothicsouth
import string
import pyperclip

def get_lines():
  lines = pyperclip.paste().split('\n')
  print(lines)
  return lines[1:]

def palindrome(line):
  return line == line[::-1]

def run():
  answer = ''
  for line in get_lines():
    line = ''.join(c.lower() for c in line if c.isalnum())
    print(line)
    if palindrome(line):
      answer += 'Y '
    else:
      answer += 'N '
  print(answer)

if __name__ == '__main__':
  run()
