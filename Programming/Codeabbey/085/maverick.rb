#Author maverick
aaa = gets.split(" ")
N = aaa[0].to_i
$angle = aaa[1].to_i * Math::PI / 180

$b = Array.new() { Array.new() }

def rotate(name, x, y)
    c = []
    c.push(name)
    x1 = (x * Math.cos($angle) - y * Math.sin($angle)).round
    y1 = (x * Math.sin($angle) + y * Math.cos($angle)).round
    c.push(x1, y1)
    $b.push(c)
end

s = ""
for i in 1..N
    a = gets.split(" ")
    rotate(a[0], a[1].to_i, a[2].to_i)
end

def swap(i)
    t = $b[i]
    $b[i] = $b[i+1]
    $b[i+1] = t
end

def sort()
    for i in 0..$b.size - 1
        for j in 0..$b.size - i - 2
            #puts $b.to_s
            if $b[j][2] > $b[j+1][2]
                swap(j)
            elsif $b[j][2] == $b[j+1][2]
                if $b[j][1] > $b[j+1][1]
                    swap(j)
                end
            end
        end
    end
end

def print_b()
    for i in 0..$b.size - 1
        print "#{$b[i][0]} "
    end
end

sort()

print_b()
#puts $b.to_s