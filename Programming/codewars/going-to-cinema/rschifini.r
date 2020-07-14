#rschifini
movie <- function(card, ticket, perc) {
  n = 1:10000
  min(which(ceiling(card + ticket * cumsum(perc^n)) < ticket * n))
}
