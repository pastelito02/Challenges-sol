--Author UpBeatTable
function getDiceRoll(n)
  n = n*6
  return (math.floor(n)+1)
end


num = io.read("*n")
roll = {}


for i = 1, num do
  roll[i] = getDiceRoll(io.read("*n"))
end

for i = 1, num do
  io.write(roll[i], " ")
end

print()
os.execute("pause")
