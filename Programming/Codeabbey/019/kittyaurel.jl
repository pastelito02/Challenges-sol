#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

function validate_brackets(str)
  brackets = replace(str, r"[^\<\>\(\)\[\]\{\}]" => "")
  brmatch = Dict('<' => '>', '{' => '}', '[' => ']', '(' => ')')
  opening, closing = 0, 0

  if brackets[1] in values(brmatch)
    return false
  end

  wanted = push!([], brmatch[brackets[1]])
  akt = 1
  opening += 1

  for i = 2:length(brackets)
    if brackets[i] in values(brmatch)
      if !isempty(wanted) && brackets[i] == wanted[akt]
        closing += 1
        deleteat!(wanted, akt)
        akt -= 1
      else
        return false
      end
    elseif brackets[i] in keys(brmatch)
      opening += 1
      push!(wanted, brmatch[brackets[i]])
      akt += 1
    end
  end

  return opening == closing
end

for i = 2:records+1
  push!(results, validate_brackets(lines[i]) ? 1 : 0)
end

for r = results
  print(r, " ")
end
