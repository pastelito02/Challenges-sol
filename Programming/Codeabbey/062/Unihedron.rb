#Author Unihedron
require'prime'
$<.drop(1).map{|x|a,b=x.split.map &:to_i
p Prime.each(b).count{|x|x>=a}}