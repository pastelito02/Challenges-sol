#! /usr/bin/crystal

# Author slayfer1112

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 3.07 milliseconds
# $ crystal build slayfer1112.cr

def data_entry()
  data = File.read("DATA.lst")
  values = [] of Array(Int32)
  data.each_line do |x|
    inter = [] of Int32
    (x.split).each do |y|
      y = y.is_a?(String) ? y.try &.to_i : y
      inter << y
    end
    values << inter
  end
  values[1..]
end

def rounding(array)
  val1 = array[0]
  val2 = array[1]

  x = val1/val2

  x = x.round(0)

  a = x.is_a?(Float64) ? x.try &.to_i : x

  print "#{a} "

end

data = data_entry()
data.each do |x|
  rounding(x)
end
puts

# $ ./slayfer1112
# -12 8814 257873 9 10419 12 2307 -2 29702 11 -1 22 7977
