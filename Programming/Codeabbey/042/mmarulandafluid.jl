#Author mmarulandafluid
f = open("DATA.lst")
lines = readlines(f)
tries = lines[1]
tam = length(lines)
deck = Dict("A" => 11, "2" => 2,"3" => 3,"4" => 4, "5" => 5,"6" => 6,"7" => 7,"8" => 8,"9" => 9,"T"=>10,"J" => 10,"Q" => 10,"K" => 10)
results = []
aceCounter = 0
for i = 2:tam
  black = 0
  arrayLines = split(lines[i])
  for x in arrayLines
    print(deck[x]," ")
    if x == "A" && black + 11 > 21 
      black = black + 1
    else
      black = black + deck[x]
    end
    println(black)
    
  end
  
  push!(results,black)
 # println(results[1])

end

for i in results
    if i > 21
      print("Bust"," ")
    else
      print(i, " ")
    end
end
close(f)