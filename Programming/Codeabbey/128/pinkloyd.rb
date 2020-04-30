#Author pinkloyd
nums = ARGF.file.read.split("\n")[1..-1].map(&:split).map {|y| y.map(&:to_i)}

def factorial(num)
  return 1 if num == 0
  (1..num).inject(&:*)
end

def combinations_count(a)
  n, k = a[0], a[1]
  factorial(n) / (factorial(k) * factorial(n - k))
end

puts nums.map { |x| combinations_count(x) }.join(' ')
