#Author maverick
N = gets.to_i
def height(d, a)
  puts "#{d} - #{a}"
  h = (d * Math.tan(Math::PI * a / 180)).round.to_s
  return h
end

s = ""
for i in 1..N
  a = gets.split(" ")
  s += height(a[0].to_i, a[1].to_f - 90) + " "
end
puts s
