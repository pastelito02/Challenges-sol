--Author ayy_luamao
f = assert(io.open("abbey_044.txt", "r"))

lines = f:read("*number")

io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
  local a = f:read("*number")
  local b = f:read("*number")
  io.write(a, " ", b, "\n")

  answers[i] = (a % 6 + 1) + (b % 6 + 1)
end

io.write("\nanswer:\n")
for i=1,lines do
  io.write(answers[i], " ")
end
io.write("\n")
