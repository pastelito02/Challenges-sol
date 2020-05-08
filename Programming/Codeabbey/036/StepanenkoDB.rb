#Author StepanenkoDB
#!/usr/bin/env ruby -w
class Guesser
  def initialize(amount)
    @cases = {}
    amount.times do # just initializing
      tmp = gets.split
      @cases[tmp[0]] = tmp[1].to_i
    end
    @first = Array.new(11)
    @second = Array.new(11)
    @third = Array.new(11)
    @fourth = Array.new(11)
    @actual = Array.new(5,true)
  end

  def guess
    #while (not @first.include?(1)) or (not @second.include?(1)) or (not @third.include?(1)) or (not @fourth.include?(1))
      find_possible_numbers
      find_exact_numbers
      puts @cases
      print @first.to_s + "\n"
      print @second.to_s + "\n"
      print @third.to_s + "\n"
      print @fourth.to_s + "\n"
    #end
  end

  def find_possible_numbers
    @cases.each do |i,j|
      if j == 0
        @first[i[0].to_i] = 0 if @actual[1]
        @second[i[1].to_i] = 0 if @actual[2]
        @third[i[2].to_i] = 0 if @actual[3]
        @fourth[i[3].to_i] = 0 if @actual[4]
      else
        @first[i[0].to_i] = 0.5 if @first[i[0].to_i] != 0 && @actual[1]
        @second[i[1].to_i] = 0.5 if @second[i[1].to_i] != 0 && @actual[2]
        @third[i[2].to_i] = 0.5 if @third[i[2].to_i] != 0 && @actual[3]
        @fourth[i[3].to_i] = 0.5 if @fourth[i[3].to_i] != 0 && @actual[4]
      end
    end
  end

  def find_exact_numbers
    counter = 0
    [@first,@second,@third,@fourth].each do |i|
      counter += 1
      tmp = (i - [0] - [nil])
      if tmp.size == 1 && @actual[counter]  #it's exact number
        @actual[counter] = false
        i[i.index(0.5)] = 1
        @cases.each do |j,v|
          puts "j is #{j} and tmp[0] is #{tmp[0]}"
          v -= 1 if j.include?(i[i.index(1)].to_s)# here is an error ( kernel panic )
        end
      end
    end
  end

end

if __FILE__ == $0
  g = Guesser.new(gets.to_i)
  g.guess
end
