#! /usr/bin/crystal

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 3.19 milliseconds
# $ crystal build slayfer1112.cr

def data_entry()
  data = File.read("DATA.lst")
  values = [] of Array(Int32)
  data.each_line do |x|
    y = x.split
    inter = [] of Int32
    y.each do |j|
      inter << Int32.new(j)
    end
    values << inter
  end
  values
end

def checksum(array)
  result = 0
  seed = 113
  limit = 10000007
  array.each do |x|
    result = (result+x)*seed
    if result >= limit
      a = result.divmod(limit)
      result = a[1]
    end
  end
  result = result.is_a?(Float64) ? result.try &.to_i : result
  result
end

def solution(array)

  n = array.size-2
  vals = array[..n]
  swaps = 0
  1.step(to: n, by: 1) do |x|
    a = 0
    if vals[x-1] > vals[x]
      swaps += 1
      a = vals[x]
      vals[x] = vals[x-1]
      vals[x-1] = a
    end
  end

  checksum = checksum(vals)

  print "#{swaps} #{checksum}"

end

data = data_entry()
data.each do |x|
  solution(x)
end
puts

# $ ./slayfer1112
# 47 29 34 37 29 42 28 35
