proc expressionMatter*(a, b, c: int): int =
  return max([(a + b) * c, a * (b + c), a+b+c, a+b*c, a*b + c, a*b+c, a*b*c])
