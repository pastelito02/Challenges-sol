def better_than_average(class_points : Array(Int32), your_points : Int32)
  your_points > class_points.sum/class_points.size ? true : false
end
