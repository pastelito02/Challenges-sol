#Author lvcrft
# CodeAbbey module was made by me to reuse functions from previous problems
require_relative "CodeAbbey"

vertices = []

File.readlines("input.txt").drop(1).each do |coords|
  vertices << coords.split.map(&:to_f)
end

x_coords = []
y_coords = []
vertices.each { |pair|
  x_coords << pair[0]
  y_coords << pair[1]
}

pos_part = x_coords.zip( y_coords[1..-1] + y_coords[0..0] ).map { |e| e.inject { |a,b| a * b } }.inject { |a,b| a + b }
neg_part = y_coords.zip( x_coords[1..-1] + x_coords[0..0] ).map { |e| e.inject { |a,b| a * b } }.inject { |a,b| a + b }

area = (pos_part - neg_part) / 2

print area
