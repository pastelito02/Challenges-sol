#g964
module Cine
    export movie

    function movie(card, ticket, percent)
        pb = ticket
        sa, sb = 0, card
        i = 0
        while sa <= ceil(sb)
            pb *= percent
            sa += ticket
            sb += pb
            i += 1
        end
        i
    end

end
