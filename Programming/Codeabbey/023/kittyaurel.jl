#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
input = [parse(Int64, x) for x = split(lines[1], " ")]

function checksum(arr)
  result = 0
  seed = 113
  limit = 10000007

  for x = arr
    result = (result + x) * 113
    if result > limit
      result %= limit
    end
  end

  return result
end

function bubble(arr)
  swaps = 0

  for ptr = 2:length(arr)
    if(arr[ptr-1] > arr[ptr])
      dum = arr[ptr-1]
      arr[ptr-1] = arr[ptr]
      arr[ptr] = dum
      swaps += 1
    end
  end

  return swaps, checksum(arr)
end

results = bubble(input[1:length(input)-1])

print(results[1], " ", results[2])
