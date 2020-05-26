#Author maverick
s = ""
N = gets.to_i

def solve(k, q)
    if k[0] == q[0] || k[1] == q[1] || ((k[0].ord - q[0].ord).abs == (k[1].ord - q[1].ord).abs)
        return "Y"
    end
    return "N"
end

for i in 1..N
    pos = gets.split(" ")
    s += solve(pos[0], pos[1]) + " "
end

puts "===>"
puts s
