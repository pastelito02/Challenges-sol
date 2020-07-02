--Author memstick
require("round")
assert(#arg>2)
assert(#arg>=tonumber(arg[1])+1)

local noteOffset = {
    ["C"]  = -9,
    ["C#"] = -8,
    ["D"]  = -7,
    ["D#"] = -6,
    ["E"]  = -5,
    ["F"]  = -4,
    ["F#"] = -3,
    ["G"]  = -2,
    ["G#"] = -1,
    ["A"]  = 0,
    ["A#"] = 1,
    ["B"]  = 2,
}

for i=2,#arg do
    local note = arg[i]:sub(1,-2)
    local octave = tonumber(arg[i]:sub(-1))
    assert(noteOffset[note]~=nil and octave>0 and octave<10)
    io.write(math.round(440*2^(octave-4+noteOffset[note]/12.0)), " ")
end
print()
