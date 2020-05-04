#Author maverick
@nn = ('0'..'9').to_a + ('A'..'Z').to_a

def comb(m, n)
  if (n > (m - n))
    return (((n + 1)..m).inject(:*) || 1) / ((1..(m - n)).inject(:*) || 1)
  else
    return (((m - n + 1)..m).inject(:*) || 1) / ((1..n).inject(:*) || 1)
  end
end

def solve(a)
  m = a[0]
  n = a[1]
  ind = a[2]
  solution = ""
  curPos = 1
  curInd = 0
  i = 0
  while i < n
    cc = comb(m - curPos, n - i - 1)
    val = curInd + cc
    #puts "C#{m - curPos},#{n - i - 1} - #{cc} - #{val}"
    if (val > ind + 1)
      solution += @nn[curPos - 1]
      curPos += 1
      i += 1
    elsif (val == ind + 1)
      solution += @nn[curPos - 1]
      curPos += 1
      # curInd += val
      i += 1
    else
      curInd += cc
      curPos += 1
    end
    #puts solution.to_s
  end

  return solution
end

s = ""
File.open("in.txt", "r") do |f|
  n = f.gets.to_i
  for i in 1..n
    a = f.gets.split(" ").map(&:to_i)
    #puts a.to_s
    s += solve(a) + " "
  end
end

puts s
