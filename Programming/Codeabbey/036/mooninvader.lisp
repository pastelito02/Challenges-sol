;Author mooninvader
from itertools import combinations, product


# def propose(number, answer, forbidden):
#     if answer == 0:
#         for i in range(len(number)):
#         forbidden[i].append(int(number[i]))
#
#
# nb_guesses = int(input())
#
# for _ in range(nb_guesses):
#     number, answer = input().split(' ')
#     propose(code, number, int(answer))



'''
 ex the guess if 848 and the answer is 2
 there is three possibilities which are
 combinations of 2 of (len(word)) so the three possibilities are
 84x and no 8 in pos 2
 8x8 and no 4 in pos 1
 x48 and no 8 in pos 0
 excluded digits are marked as negatives.
 finally we also exclude the solutions we know they are
 false from the previous guesses with the answer 0
'''

all_possibilities = []

word_length = 4

def possibilities(word, nb):
  result = []
  valid_position = list(combinations([i for i in range(len(word))], nb))
  for position in valid_position:
    solution = [None for _ in range(len(word))]
    for p in position:
      solution[p] = word[p]
    for i in range(len(solution)):
      if solution[i] is None:
        solution[i] = '#' + word[i]
    result.append(solution)
  return result


def validate_guesses(rules, word_length):
  result = [None for _ in range(word_length)]
  for i in range(word_length):
    forbidden = []
    r = None
    for rule in rules:
      if rule[i].startswith('#'):
        if result[i] == rule[i][1]:
          return None
        forbidden.append(rule[i][1])
      elif (r is None or r == rule[i]) and rule[i] not in forbidden:
        r = rule[i]
        result[i] = r
      else:
        return None
  return result



nb_guesses = int(input())

for _ in range(nb_guesses):
  number, answer = input().split(' ')
  all_possibilities.append(possibilities(number, int(answer)))

#print(list(product(*all_possibilities)))

for p in list(product(*all_possibilities)):
  word = validate_guesses(p, word_length)
  if word is not None:
    print(''.join(str(i) for i in word))
