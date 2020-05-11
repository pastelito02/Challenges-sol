--Author ayy_luamao
function round(n)
  return math.floor(n + 0.5)
end

f = assert(io.open("abbey_171.txt", "r"))

lines = f:read("*line")
io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
  local dist = f:read("*number")
  local angle = f:read("*number")
  io.write(dist, " ", angle, "\n")

  angle = 90 - (180 - angle)

  --solve the resulting right triangle
  answers[i] = round(dist * math.tan(angle * (math.pi / 180)))
end

io.write("\nanswer:\n")
for i=1,#answers do
  io.write(answers[i], " ")
end
io.write("\n")
