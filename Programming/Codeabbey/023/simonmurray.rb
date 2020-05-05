#Author simonmurray
#!/usr/bin/ruby

input = File.open('23.in').readlines.first.split.map(&:to_i)
# Discard the terminating -1
input.pop

count = 0
# Only do this for values who have a successor e.g. [0, 1, 2, 3]
# The length is 4, we conly consider upto index 2
(0..input.length-2).each do |i|
  # Next element is less than the current one, swap it
  if input[i+1] < input[i]
    t = input[i]
    input[i] = input[i+1]
    input[i+1] = t
    count += 1
  end
end

output = input.inject(0) do |acc, i|
  acc = ((acc + i) * 113) % 10000007
end

puts "#{count} #{output}"
