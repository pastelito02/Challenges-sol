--Author ayy_luamao
f = assert(io.open("abbey_048.txt", "r"))

nums = f:read("*number")

io.write("input data:\n", nums, "\n")

answers = {}

for i=1,nums do

  n = f:read("*number")

  io.write(n, " ")

  count = 0

  while n ~= 1 do
    if n % 2 == 0 then
      n = n / 2
    else
      n = (3 * n) + 1
    end
    count = count + 1
  end

  answers[i] = count
end

io.write("\n\nanswer:\n")

for i=1,nums do
  io.write(answers[i], " ")
end

io.write("\n")
