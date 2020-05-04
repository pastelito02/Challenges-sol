#Author mooninvader
#From the Python 3.6 itertools recipes:
#https://docs.python.org/3/library/itertools.html#itertools-recipes
l = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
   'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

def nth_combination(iterable, r, index):
  pool = tuple(iterable)
  n = len(pool)
  if r < 0 or r > n:
    raise ValueError
  c = 1
  k = min(r, n - r)
  for i in range(1, k + 1):
    c = c * (n - k + i) // i
  if index < 0:
    index += c
  if index < 0 or index >= c:
    raise IndexError
  result = []
  while r:
    c, n, r = c * r // n, n - 1, r - 1
    while index >= c:
      index -= c
      c, n = c * (n - r) // n, n - 1
    result.append(pool[-1 - n])
  return ''.join([str(i) for i in result])



result = []

nb_lines = int(input())
for _ in range(nb_lines):
  n, k, index = [int(i) for i in input().split(' ')]
  result.append(nth_combination(l[0:n], k, index))

print(' '.join(result))
