#Author threeifbywhiskey
suits = %w[Clubs Spades Diamonds Hearts]
ranks = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
gets
puts gets.split.map(&:to_i).map { |n|
  "#{ranks[n % 13]}-of-#{suits[n / 13]}"
} * ' '