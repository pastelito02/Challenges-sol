#Author Vladimir Skvortsov
def do_move(point)

    @ways.each do |moves| 
            
        x, y = point[0], point[1]
        
        #if end point is in this 2x2 square - then there is not much possible combinations
        if @board[[x,y-1]] == '$' or @board[[x+1,y]] == '$' then #end point is straight down or to the right
            @res +=1
            return
        elsif @board[[x,y-1]] == 'X' and @board[[x+1,y]] == 'X' then #no ways - dead end
            return
        elsif @board[[x+1,y-1]] == '$' and (@board[[x+1,y]] == 'X' or @board[[x,y-1]] == 'X') then     #end point at the bottom right corner and there is only one direction ways
            @res +=1
            return
        elsif @board[[x+1,y-1]] == '$' then    #end point at the bottom right corner
            @res +=2
            return
        end

        #end point is outside the current area
        can_go = true
        moves.each_char do |ch|
            ch == 'r' ? x += 1 : y -=1

            if @board[[x,y]] == "+" then
                next;
            else
                @res +=1 if @board[[x,y]] == '$'
                can_go = false
                break;
            end
        end
        
        do_move([x,y]) if can_go #going to next area

    end
end

###### MAIN ###########
input     = File.open("InputData.txt",     "r")
output     = File.open("result.txt",         "w")
@res     = 0
@board     = {}

while (line = input.gets) do

    next if input.lineno == 1
    line.strip.split().each_with_index { |val, id| @board[[id, -input.lineno+2]] = val} #translates maze as hash
          
end    

do_move([0, 0])
    
print @res
output.write(@res)