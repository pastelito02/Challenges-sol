#hibreez
def movie(card, ticket, perc)
  sys_a = ticket
  sys_b = card + ticket * perc
  n = 1

  until sys_b.ceil < sys_a.ceil do
    n += 1
    sys_a += ticket
    sys_b += ticket * perc**n
  end
  n
end
