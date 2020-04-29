#! /usr/bin/crystal

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 51.7 milliseconds
# $ crystal build slayfer1112.cr

def data_entry()
  data = File.read("DATA.lst")
  values = [] of Array(Float64)
  data.each_line do |x|
    inter = [] of Float64
    (x.split).each do |y|
      y = y.is_a?(String) ? y.try &.to_f : y
      inter << y
    end
    values << inter
  end
  values[1..]
end

def solution(array)
  r = 1
  x = array[0]
  n = array[1]
  i = 0
  while i<n
    d = x/r
    r = (r+d)/2
    i+=1
  end
  a = r.is_a?(Float64) ? r.try &.to_i : r
  b = r.divmod(a)
  if b[1] == 0
    print "#{a} "
  else
    print "#{r} "
  end
end

data = data_entry()
data.each do |x|
  solution(x)
end
puts

# $ ./slayfer1112
# 219.2680589727784 1649.559110569358 24.48936170212766 126.31114538360205
# 8.366600265340756 87.6818422209526 7.0710678118654755 159.2930151371662
# 6.782329983125268 70.12851739897322 694.4357809978496
