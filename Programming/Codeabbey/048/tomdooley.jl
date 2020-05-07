#Author tomdooley
function collatz_step(n)
  ifelse (n % 2 != 0, 3n+1, n>>1)
end

function collatz(n::Integer)
  k = 0
  while n > 1
    # println(n)
    # n = ifelse (n % 2 != 0, 3n+1, n>>1)
    n = collatz_step(n)
    k += 1
  end
  return k
end

#
fn = open("d:\InputCollatz.txt")
nNums = int(readline(fn))
# fill the array. this could be a function that takes the array and the number of elements to fill
for i=1:nNums
  j = int(readuntil(fn," "))
  print(collatz(j)," ")
end
