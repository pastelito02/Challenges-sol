#aaronsaunders
is_divisible <- function(n, x, y) {
  all(n %% x == 0, n %% y == 0)
}
