#Author maverick
@notes = "C  C#  D  D#  E  F  F#  G  G#  A  A#  B".split(" ")
@step = 2 ** (1/12.0)

def getFreq(note)
    octave = note[note.size-1].to_i
    l = (note.size == 3) ? note[0..1] : note[0]
    freq = 27.5 * (2 ** (octave - 1)) * (@step ** (@notes.index(l) + 3))

    puts "#{l}, #{octave} - #{freq.round}"
    return freq.round
end

def solve(a)    
    s = ""
    for i in 0..(a.size - 1)
        s += "#{getFreq(a[i])} "
    end
    return s
end

a = []
File.open("in.txt", "r") do |f|
    n = f.gets.chomp.to_i
    a = f.gets.split(" ")
end

s = solve(a)

puts s