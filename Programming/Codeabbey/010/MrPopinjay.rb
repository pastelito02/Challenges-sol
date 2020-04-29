# Author MrPopinjay
#!/usr/bin/env ruby
# encoding: utf-8

# y * x = a * x + b

data = ARGF.file.read.split("\n")[1..-1].map { |e| e.split ' ' }
data.map! do |e|
  e.map! { |r| r.to_i }
  slope  = (e[3] - e[1]) / (e[2] - e[0])
  offset = e[1] - (e[0] / ((e[2] - e[0]) / (e[3] - e[1]).to_f)).to_i
  "(#{slope} #{offset})"
end
puts data.join ' '
