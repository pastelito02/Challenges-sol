-- Author danilofusco
io.write("Please enter the number of pairs to calculate: ")
n = io.read("*n")
io.write("Please enter the pairs: ")

for i = 1, n do
  a, b = io.read("*n", "*n")
  if a <= 0 and b >= 0 then
    temp = a / b
    io.write(math.ceil(temp-0.5) .. " \n")
  elseif a >= 0 and b <= 0 then
    temp = a / b
    io.write(math.ceil(temp-0.5) .. " \n")
  else
    temp = a / b
    io.write(math.floor(temp+0.5) .. " \n")
  end
end
