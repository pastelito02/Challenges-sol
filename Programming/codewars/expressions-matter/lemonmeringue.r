#lemonmeringue
expression_matter <- function(a, b, c) {
  # your code here
  max(c(a*b*c, a+b+c, a*b+c, a+b*c, (a+b)*c, a*(b+c)))

}
