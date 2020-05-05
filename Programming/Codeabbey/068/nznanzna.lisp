;Author nznanzna
n = int(input())
data   = []
result = []
count  = 0

while count < n:
  val = input().split()
  data.append(val)
  count += 1

def meeting_distance(s, a, b):
  total_speed = a + b
  meet_dist = (s / total_speed) * a
  return meet_dist

for options in data:
  options = [int(opt) for opt in options]
  res = meeting_distance(*options)
  result.append(res)

result = [str(x) for x in result]
result = " ".join(result)
print(result)
