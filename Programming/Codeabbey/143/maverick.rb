#Author maverick
def solve(x, y)
    sp = 1
    sc = 0
    tp = 0
    tc = 1
    ttx = x
    tty = y
    r = 1
    while r != 0
        q = x / y
        r = x % y
        if y < r
            x = r
        end
        x = y
        y = r
        if r == 0 then break end
        sn = sp - q * sc
        sp = sc
        sc = sn

        tn = tp - q * tc
        tp = tc
        tc = tn
        puts "#{x}, #{y} = #{sc}, #{tc}"
    end
    return "#{sc * ttx + tc * tty} #{sc} #{tc}"
end

s = ""
File.open("in.txt", "r") do |f|
    n = f.gets.to_i
    for i in 1..n
        a = f.gets.chomp.split(" ").map(&:to_i)
        s += "#{solve(a[0], a[1])} "
    end
end

puts s