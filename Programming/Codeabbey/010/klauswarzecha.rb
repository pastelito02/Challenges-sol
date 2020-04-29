# Auhtor klauswarzecha
def linreg(x1, y1, x2, y2):
  '''return slope and intercept for line
  defined by two points (x1, y1), (x2, y2)'''

  slope = (y2 - y1) / (x2 - x1)
  intercept = y1 - slope * x1

  return slope, intercept

# read data from file
testdata = 'linearfunction.txt'


with open(testdata) as f:
  _ = f.readline() # drop first line
  for line in f:
    x1, y1, x2, y2 = map(int, line.strip().split())
    a, b = linreg(x1, y1, x2, y2)
    print('({} {})'.format(int(a), int(b)), end = ' ')
