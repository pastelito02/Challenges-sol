#Author Roman Ovcharov
rules = {
  RR: :nobody,
  SS: :nobody,
  PP: :nobody,
  RS: :first,
  SP: :first,
  PR: :first,
  SR: :second,
  PS: :second,
  RP: :second
}

results = []

n = gets.to_i

n.times do
  score = {
    first: 0,
    second: 0,
    nobody: 0
  }
  game = gets.split(" ").map(&:to_sym)
  game.each do  |e|
    score[rules[e]] += 1
  end
  results.push(score[:first] > score[:second]? 1 : 2)
end

puts results.join(" ")
