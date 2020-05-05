#Author fridxfridx
def round_down(n)
  string = n.to_s
  index = string.rindex('.')
  if index <= string.length - 4
    string = string[0..index+3]
    string[-1] = "0"
    return string.to_f
  else
    return string.to_f
  end
end

filename = 'input.txt'
output = ""
if File.exists?(filename) == true
  contents = IO.readlines(filename)
  lines = contents[0].to_i
  i = 1
  while i <= lines do
    start, goal, interest = contents[i].split(" ")
    start = start.to_f
    goal = goal.to_i
    interest = interest.to_f
    interest /= 100
    total = start
    years = 0
    while total < goal do
      total += total * interest
      total = round_down(total)
      years += 1
    end
    output << "#{years} "
    i+=1
  end
end
puts output
