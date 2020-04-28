#Author seerozha777
s_list = []

with open('palindrome.txt', encoding='utf-8-sig') as f:
  nums = f.readlines()

for i in range(len(nums)):
  nums[i] = nums[i].strip()
  nums[i] = nums[i].split()
  nums[i] = ''.join(nums[i])

for n in nums:
  s = n.replace(',', '').replace('-', '')
  s_list.append(s)

for i in range(len(s_list)):
  s_list[i] = s_list[i].lower()

for s in s_list:
  if s == s[::-1]:
    print('Y', end=' ')
  else:
    print('N', end=' ')
