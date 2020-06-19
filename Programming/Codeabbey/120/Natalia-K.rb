#Author Natalia K
def selection_sort (array)
  l = array.length - 1
  k = l
  (0...l).each do |i|
    ind_of_max = 0 # indices of the maximums at each pass (N-1 values).
    index = l-i
    (0...k).each do |j|
      if array[j] > array[index]
        index = j
      end
    end
    k -= 1
    ind_of_max = index
    smaller_num = array[index]
    array[index] = array[l-i]
    array[l-i] = smaller_num
    
    print ind_of_max
    print " "
  end
  return array
end

# a = [8,2,5,1,3,6]
# print selection_sort(a)

size = gets.chomp.to_i
array = gets.chomp.split(" ")
array.map!{|i| i.to_i}
selection_sort(array)
