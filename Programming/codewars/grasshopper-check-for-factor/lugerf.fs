//lugerf
let checkForFactor b f =
    match f with
    | 0 -> false
    | f when b % f = 0 -> true
    | f -> false
