#Author maverick
def getAngle(x1, y1, x2, y2)
    scalar = x1 * x2 + y1 * y2 
    cos = scalar / (Math.sqrt(x1 * x1 + y1 * y1) * Math.sqrt(x2 * x2 + y2 * y2))
    # puts "#{Math.acos(cos)}"
    return Math.acos(cos)
end

def getDist(x1, y1, x2, y2)
    return Math.sqrt((y2 - y1) ** 2 + (x2 - x1) ** 2)
end

def getHeight(x1, y1, x2, y2, px, py)
    base = getDist(x1, y1, x2, y2)
    square = 0.5 * ((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py))
    return (2 * square / base).abs
end

def solve(x1, y1, x2, y2, px, py)
    res = 0.0
    # puts "#{x1}, #{y1}, #{x2}, #{y2}"

    a1 = getAngle(x2 - x1, y2 - y1, px - x1, py - y1)
    if (a1 > Math::PI / 2)
        return getDist(x1, y1, px, py)
    end
    a2 = getAngle(x1 - x2, y1 - y2, px - x2, py - y2)
    if (a2 > Math::PI / 2)
        return getDist(x2, y2, px, py)
    end

    return getHeight(x1, y1, x2, y2, px, py)
end

s = ""
File.open("in.txt", "r") do |f|
    n = f.gets.to_i
    for i in 1..n
        a = f.gets.chomp.split(" ").map(&:to_i)
        s += "#{solve(a[0], a[1], a[2], a[3], a[4], a[5])} "
    end
end

puts s