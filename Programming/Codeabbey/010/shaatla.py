#Author shaatla
for line in open('input_data.txt', 'r').readlines():
  x1, y1, x2, y2 = [int(i) for i in line.split()]
  a = round((y1 - y2) / (x1 - x2))
  b = round(y1 - a*x1)
  answer = a, b
  print(str(answer).replace(',', ''))
