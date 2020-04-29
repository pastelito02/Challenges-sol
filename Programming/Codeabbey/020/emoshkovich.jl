#Author emoshkovich
function find_num_vowels(s)
  count = 0
  vowels="aouiey"
  for l in s
    if in(l, vowels)
      count+=1
    end
  end
  return count
end

f = open("C:\\Users\\evmosh\\Desktop\\input.txt")
while !eof(f)
  line=readline(f)
  num_vowels = find_num_vowels(line)
  print("$num_vowels ")
end
close(f)
