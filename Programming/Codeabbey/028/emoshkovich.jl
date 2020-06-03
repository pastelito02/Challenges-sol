#Author emoshkovich
function calc_bmi(w, h)
  return int(w) / float(h)^2
end

under = 18.5
normal = 25.0
over = 30.0
f = open("C:\\Users\\evmosh\\Desktop\\input.txt")
while !eof(f)
  params = split(readline(f), " ")
  
  bmi_num = calc_bmi(ascii(params[1]), ascii(params[2]))
  if bmi_num < under
    print("under ")
  elseif under <=bmi_num < normal
    print ("normal ")
  elseif normal <= bmi_num < over
    print ("over ")
  else 
    print ("obese ")
  end
end
close(f)