#! /usr/bin/crystal

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 3.19 milliseconds
# $ crystal build slayfer1112.cr

def data_entry()
  data = File.read("DATA.lst")
  values = [] of Array(String)
  data.each_line do |x|
    inter = x.split()
    values << inter
  end
  values[1..]
end

def vowel_count(array)
  hash = Hash(String,Int32).new
  array.each do |x|
    hash[x] = 0 if !hash.has_key?(x)
    hash[x] += 1
  end
  1.step(to: hash.size, by: 1) do |x|
    print "#{hash[x.to_s]} "
  end
end

data = data_entry()
data.each do |x|
  vowel_count(x)
end
puts

# $ ./slayfer1112
# 47 29 34 37 29 42 28 35
