#Author maverick


def solve(point, length, azimuth)
    a = (90 - azimuth.to_f) * Math::PI / 180
    # if (a > 0)
    #     a *= Math::PI / 180
    # else 
    #     a = (a + 360) * Math::PI / 180
    # end
    point[0] += length.to_f * Math.cos(a)
    point[1] += length.to_f * Math.sin(a)
    # puts "#{point[0]} #{point[1]}"
    return point
end

File.open("in.txt", "r") do |f|
    point = [0, 0]
    f.gets
     f.each_line do |line|
        a = line.split("feet")
        if a.size > 1
             point = solve(point, a[0][/\d+/], a[1][/\d+/])
        end
      end
      puts "#{point[0].round} #{point[1].round}"
end