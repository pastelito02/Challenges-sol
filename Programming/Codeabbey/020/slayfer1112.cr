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
    inter = x.split(separator: "")
    values << inter
  end
  values[1..]
end

def vowel_count(array)
  counter = 0
  array.each do |x|
    if x.index(/([aeiouy])/)
      counter += 1
    end
  end
  print "#{counter} "
end

data = data_entry()
data.each do |x|
  vowel_count(x)
end
puts

# $ ./slayfer1112
# 10 4 8 18 8 10 10 15 11 11 11 8 12 10 11 9 17 9 13 6
