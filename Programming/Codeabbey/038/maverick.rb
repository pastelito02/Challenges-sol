#Author maverick
s = ""
N = gets.to_i

def solve(a)
    complex = false
    d = a[1] ** 2 - 4 * a[0] * a[2]
    if d < 0
        d = d.abs
        complex = true
    end
    if complex
        s1 = (-a[1] / (2 * a[0])).to_i
        s2 = (Math.sqrt(d) / (2 * a[0])).to_i
        return "#{s1}+#{s2.abs}i #{s1}-#{s2.abs}i;"        
    else
        x1 = ((-a[1] + Math.sqrt(d)) / (2 * a[0])).to_i
        x2 = ((-a[1] - Math.sqrt(d)) / (2 * a[0])).to_i
        a = [x1, x2].sort.reverse!
        return "#{a[0]} #{a[1]};"
    end
end

for i in 1..N 
    a = gets.split(" ").map(&:to_i)
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
