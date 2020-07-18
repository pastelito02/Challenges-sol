#noriyotcp
def first_non_consecutive(arr)
  arr.each_cons(2) do |nums|
    return nums[1] if (nums[1] - nums[0]) > 1
  end
end
