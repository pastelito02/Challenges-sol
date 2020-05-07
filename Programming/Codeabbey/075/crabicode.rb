#Author crabicode
class Array
  def occurrences
    @occurrences = Array.new(6, 0)
    self.each { |d| @occurrences[d - 1] += 1 }
    @occurrences
  end
  def schema
    occurrences
    return 'yacht' if @occurrences.select { |o| (o / 5) == 1 }.one?
    return 'small-straight' if @occurrences == [1, 1, 1, 1, 1, 0]
    return 'big-straight' if @occurrences == [0, 1, 1, 1, 1, 1]
    return 'full-house' if @occurrences.select { |o| (o / 2 == 1 && o / 3 != 1) }.one? && @occurrences.select { |o| (o / 3) == 1 }.one?
    return 'two-pairs' if @occurrences.select { |o| (o / 2) == 1 }.size > 1
    return 'four' if @occurrences.select { |o| (o / 4) == 1 }.any?
    return 'three' if @occurrences.select { |o| (o / 3) == 1 }.any?
    return 'pair' if @occurrences.select { |o| (o / 2) == 1 }.one?
    return 'none'
  end
end

puts %w{
  6 3 4 1 5
  2 3 4 5 1
  4 2 3 2 5
  2 3 4 5 6
  2 3 4 5 6
  2 2 2 2 2
  2 3 4 5 1
  2 5 6 2 5
  4 2 5 2 4
  1 1 2 4 1
  2 5 1 6 5
  2 3 4 5 1
  2 1 1 2 2
  1 1 1 1 1
  3 6 6 6 6
  2 3 4 5 6
  2 3 4 5 6
  6 6 6 6 6
  2 3 4 5 6
  1 5 5 2 4
  2 3 4 5 6
  5 1 4 6 1
  5 3 6 5 5
  1 5 5 6 1
  6 2 3 1 3
  4 4 4 4 4
}.map(&:to_i).each_slice(5).map(&:schema).join(' ')
