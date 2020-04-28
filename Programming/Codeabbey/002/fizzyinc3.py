#Author fizzyinc3
text = '''32
773 752 1071 515 1293 63 719 934 394 187 1190 669 80 1065 19 1248 492 443 1001 670 689 543 845 887 764 102 758 16 775 946 185 247'''.split('\n')

numberofvalues = int(text[0])
values = text[1].split(' ')

ans = 0
for i in range(numberofvalues):
  ans += int(values[i])

print(ans)
