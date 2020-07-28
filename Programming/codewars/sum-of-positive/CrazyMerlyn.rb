#CrazyMerlyn
def positive_sum(arr)
  arr.select{|x| x > 0}.reduce(0, :+)
end
