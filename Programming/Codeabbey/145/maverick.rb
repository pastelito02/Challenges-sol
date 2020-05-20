#Author maverick
def solve(a, b, m)
    j = 0
    solution = 1
    while (j < b)
        res = a
        i = 1
        while i*2 <= (b - j)
            res = (res ** 2) % m
            i *= 2
            #puts "#{i} - #{res}" 
        end
        j += i
        solution = (solution * res) % m
        #puts "J #{j} - #{solution}"
    end
    return solution
end

s = ""
File.open("in.txt", "r") do |f|
    n = f.gets.to_i
    for i in 1..n
        a = f.gets.split(" ").map(&:to_i)
        s += solve(a[0], a[1], a[2]).to_s + " "
    end
end

puts s