#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

function rotate_string(k, str)
    if k==0
        return str
    elseif k<0
        return str[end+k+1:end]*str[1:end+k]
    else
        return str[k+1:end]*str[1:k]
    end
end

for i = 2:records+1
    inputs = split(lines[i], " ")
    push!(results, rotate_string(parse(Int64, inputs[1]), inputs[2]))
end

for r = results
    print(r, " ")
end

