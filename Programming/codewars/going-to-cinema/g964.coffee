# g964
movie = (card, ticket, perc) ->
  i = 0
  sb = card
  sa = 0
  prev = ticket
  loop
    i++
    nou = prev * perc
    sb += nou
    prev = nou
    sa += ticket
    if Math.ceil(sb) < sa
      return i
  return
