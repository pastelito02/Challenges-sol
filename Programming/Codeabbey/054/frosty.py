#Author frosty
import numpy as np

def gen_prim_pyth_trips(limit=None):
  u = np.mat(' 1  2  2; -2 -1 -2; 2 2 3')
  a = np.mat(' 1  2  2;  2  1  2; 2 2 3')
  d = np.mat('-1 -2 -2;  2  1  2; 2 2 3')
  uad = np.array([u, a, d])
  m = np.array([3, 4, 5])
  while m.size:
    m = m.reshape(-1, 3)
    if limit:
      m = m[m[:, 2] <= limit]
    yield from m
    m = np.dot(m, uad)


def gen_all_pyth_trips(limit):
  for prim in gen_prim_pyth_trips(limit):
    i = prim
    for _ in range(limit//prim[2]):
      yield i
      i = i + prim

print('Please wait...')
solver = {sum(triplet): triplet[2] ** 2 for triplet in gen_all_pyth_trips(10**7)}
print('INPUT:')

out = [solver[int(input())] for _ in range(int(input()))]

print(*out)
