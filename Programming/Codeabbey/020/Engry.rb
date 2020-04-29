#Author Engry
#angabe der beiden dateien
from_file, to_file = ARGV
#angabe welche files eingelesen werden
puts "Kopiere von #{from_file} zu #{to_file}"
#öffne die input datei und speicher in neuer datei
indata = open(from_file).read.split("\n")#.map.with_index { |s| s.to_i }
#gehe durch indata und zähle die umlaute pro item
outdata=[]


indata.each do |x|
  puts x.count('aeouiy')
end



#puts "mpd    fawjis  wymox tnnant ep rfxeyrrkrpavh qf".count('aeouiy')
