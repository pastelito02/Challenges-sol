#Author annettes
def doub_dice(a, b)
  a1 = a % 6 + 1
  b1 = b % 6 + 1
  return a1 + b1
end

file = 'dice_data.txt'
data1 = []
f = File.open(file, "r")
f.each_line { |line|
  data1 << line.split()
}
f.close

for i in 0..data1.length - 1
  print doub_dice(Integer(data1[i][0]) , Integer(data1[i][1])) ,  " "
end
