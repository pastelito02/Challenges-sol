--Author memstick
#!/usr/bin/env lua
assert(#arg>1)

local anagram = {}
for line in io.lines("words.txt") do
  if #line>0 then
    local word = {}
    for c in line:gmatch("(%l)") do
      word[#word+1] = c
    end
    table.sort(word)
    word = table.concat(word)
    if anagram[word]==nil then
      anagram[word] = 0
    else
      anagram[word] = anagram[word] + 1
    end
  end
end

for i=2,#arg do
  local word = {}
  for c in arg[i]:gmatch("(.)") do
    word[#word+1] = c
  end
  table.sort(word)
  word = table.concat(word)
  assert(anagram[word]~=nil)
  io.write(anagram[word], " ")
end
print()
