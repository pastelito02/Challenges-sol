return {
  better_than_average= function(class_points, your_points)
    local sum = 0
    for _, v in pairs(class_points) do
      sum = sum + v
    end
    return sum / #class_points < your_points
  end
}
