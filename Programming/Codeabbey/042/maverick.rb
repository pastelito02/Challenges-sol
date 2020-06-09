#Author maverick
s = ""
N = gets.to_i
B = ["K", "Q", "J"]
NUM = Array.new(9) { |i| i + 2}

def solve(a)
    res = 0
    aces = []
    a.each do |v|
        if (B.include? v) || (v == "T")
            res += 10
        elsif NUM.include? v.to_i
            res += v.to_i
        else
            if res > 10
                res += 1
            else
                res += 11
                aces.push(1)
            end
        end
        puts "#{v} - #{res}"
        if res > 21 
            if aces.size > 0 
                res -= 10
                aces.pop
            else
                return "Bust"
            end
        end
    end
    return res.to_s
end

for i in 1..N
    a = gets.split(" ").map(&:to_s)
    s += solve(a) + " "
end

def str(b)
    res = []
    s = ""
    for v in 0..b.size
        if b[v]
            #s += v.to_s + " "
            res.push(v)
        end
    end
    return res
end


puts ">> #{s}"
