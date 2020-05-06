#Author lkfroxas
def matchingBrackets(input)
  input.tr!("^[](){}<>", "")
  puts input
  input = input.split('')

  brackets = Array.new
  answer = 1
  input.each do
    |bracket|
    if (/[\[({<]/.match(bracket))
      brackets << bracket
    else
      toCheck = brackets.pop
      case toCheck
      when '['
        answer = 0 unless bracket == ']'
      when '('
        answer = 0 unless bracket == ')'
      when '{'
        answer = 0 unless bracket == '}'
      when '<'
        answer = 0 unless bracket == '>'
      else
        answer = 0
      end
    end
  end
  answer = 0 unless brackets.length == 0

  return answer
end

puts 'Data File:'
inputFile = gets.chomp

answer = Array.new
File.foreach(inputFile) { |input| answer << matchingBrackets(input) }

puts "Answer:\n"
answer.each { |area| print area.to_s + ' '}
