#Author lvcrft
# CodeAbbey module was made by me to reuse functions from previous problems
# Might not be the most efficient way ever but it only takes 4 seconds to generate and analyze 900_000 words
# So it's fine by me!
# Ruby was never gonna be C++ fast anyways
require_relative "CodeAbbey"

consonants = "bcdfghjklmnprstvwxz".chars
vowels     = "aeiou".chars
hash       = Hash.new(0)

puts "Please input seed."
seed = gets
seed = seed.to_i

start = Time.now

words = []
900_000.times {
  letters = CodeAbbey.lin_con_gen(445, 700001, 2097152, seed, 6)
  seed    = letters[-1]
  (0..5).each do |i|
    if i % 2 == 0
      letters[i] = consonants[ letters[i] % 19 ]
    else
      letters[i] = vowels[ letters[i] % 5 ]
    end
  end
  words << letters.join
}

words.each{ |str| hash[str] += 1 }

File.open("output.txt", "w") { |file| file.write( hash.max_by{|k,v| v}[0] ) }

finish = Time.now
puts finish - start