;Author shaatla
args_total = []
for line in open('input_data.txt', 'r'):
  args = []
  a, b, n = [int(i) for i in line.split()]
  i = 1
  args.append(a)
  while i < n:
    args.append(a+b*i)
    i += 1
  args_total.append(sum(args))


print(*args_total)
