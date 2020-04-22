#Author tyler_will
data = "on the !inhabitants of these !states !for cutting off our !trade with all parts powers from the consent of the governed !that whenever any !form of as to them shall seem most likely to effect their !safety and !happiness"

$encoding = {
    ' ' => "11",
    't' => "1001",
    'n' => "10000",
    's' => "0101",
    'r' => "01000",
    'd' => "00101",
    '!' => "001000",
    'c' => "000101",
    'm' => "000011",
    'g' => "0000100",
    'b' => "0000010",
    'v' => "00000001",
    'k' => "0000000001",
    'q' => "000000000001",
    'e' => "101",
    'o' => "10001",
    'a' => "011",
    'i' => "01001",
    'h' => "0011",
    'l' => "001001",
    'u' => "00011",
    'f' => "000100",
    'p' => "0000101",
    'w' => "0000011",
    'y' => "0000001",
    'j' => "000000001",
    'x' => "00000000001",
    'z' => "000000000000"
}

def get_bin_seq(s)
    bin_seq = s.chars.map { |c| $encoding[c] } .join
    bin_seq << "0" until bin_seq.length % 8 == 0
    bin_seq
end

def convert_to_hexes(bin_seq)
    bin_seq.chars.each_slice(8).map do |byte|
        initial = byte.join.to_i(2).to_s(16).upcase
        initial.length == 1 ? '0'.concat(initial) : initial
    end
end

puts convert_to_hexes(get_bin_seq(data))
