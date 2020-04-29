#! /usr/bin/crystal

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 5.4 milliseconds
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

def linear_func(array)
  x1 = array[0]
  y1 = array[1]
  x2 = array[2]
  y2 = array[3]

  x = ((y2-y1)/(x2-x1))
  y = ((x2*y1)-(x1*y2))/(x2-x1)

  a = x.is_a?(Float64) ? x.try &.to_i : x
  b = y.is_a?(Float64) ? y.try &.to_i : y

  print "(#{a} #{b}) "

end

data = data_entry()
data.each do |x|
  linear_func(x)
end
puts

# $ ./slayfer1112
# (-1 -652) (4 -652) (25 468) (54 -773) (69 -117) (85 -716) (-38 380)
# (-22 -724) (-38 -546) (-20 595) (6 -908) (-68 -173) (71 -327) (-4 -858)
