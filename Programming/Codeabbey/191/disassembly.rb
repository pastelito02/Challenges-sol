#Author disassembly
total = gets.chomp.to_i
testCases = []
for input in 1..total
  testCases.push(gets.chomp)
end

solution = []

testCases.each do |testCase|
  lower = lSwap = 0
  testCase.each_char.with_index do |char, index|
    lower = index
    for position in index + 1..testCase.length - 1
      if testCase[position] < char && testCase[position] <= testCase[lower]
        if index != 0 || testCase[position] != '0'
          lower = position
          lSwap = index
        end
      end
    end
    if lower != index
      break
    end
  end
  upper = uSwap = 0
  testCase.each_char.with_index do |char, index|
    upper = index
    for position in index + 1..testCase.length - 1
      if testCase[position] > char && testCase[position] >= testCase[upper]
        upper = position
        uSwap = index
      end
    end
    if upper != index
      break
    end
  end
  min = testCase.clone
  min[lSwap], min[lower] = min[lower], min[lSwap]
  max = testCase.clone
  max[uSwap], max[upper] = max[upper], max[uSwap]
  solution.push(min, max)
end

puts solution.join(' ')