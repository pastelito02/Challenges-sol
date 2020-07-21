//batkiz
let expressionMatter (a: int) (b: int) (c: int): int =
    (max (a+b+c) (a*b*c), max ((a+b)*c) (a*(b+c))) ||> max
