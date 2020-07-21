(*user1326445*)
let expression_matter a b c = a + b + c |> max ((a + b) * c) |> max (a * (b + c)) |> max (a * b * c)
