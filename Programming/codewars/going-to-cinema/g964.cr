#g964
def movie(card, ticket, perc)
  i = 0; sb = card; sa = 0; prev = ticket
  while true
      i += 1
      nou = prev * perc
      sb += nou
      prev = nou
      sa += ticket
      if (sb.ceil < sa)
        return i
    end
  end
end
