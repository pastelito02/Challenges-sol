#Author maverick
@angle = {"A" => 0.0, "B" => Math::PI / 3.0, "C" => 2 * Math::PI / 3.0, "D" => Math::PI, "E" => 4 * Math::PI / 3.0, "F" => 5 * Math::PI / 3.0}

def solve(path)
  pos = [0.0, 0.0]
  for i in 0..(path.size - 1)
    pos[0] += Math::cos(@angle[path[i]])
    pos[1] += Math::sin(@angle[path[i]])
    #puts "#{i}: #{path[i]} #{@angle[path[i]]}, #{pos}"
  end
  return Math::sqrt(pos[0] ** 2 + pos[1] ** 2).round(8).to_s
end

s = ""
File.open("in.txt", "r") do |f|
  n = f.gets.to_i
  for i in 1..n
    a = f.gets.chomp
    s += solve(a).to_s + " "
  end
end

puts s
