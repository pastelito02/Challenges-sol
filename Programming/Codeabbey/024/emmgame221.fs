//Author emmgame221
let nextPseudoRandom x =
    let squared = (x * x)
    (squared / 100) % 10000

let itersToRepeat x =
    let mutable iterations = 1
    let mutable next = nextPseudoRandom x
    let prev = Array.zeroCreate 1000
    while (not (Array.exists ((=) next) prev)) do
        prev.[iterations] <- next
        next <- (nextPseudoRandom next)
        iterations <- (iterations + 1)
    iterations

[<EntryPoint>]
let main argv = 
    let numLines = Int32.Parse (Console.ReadLine())
    let data = List.map Int32.Parse (Array.toList (Console.ReadLine().Split()))
    let results = List.map itersToRepeat data
    for result in results do
        printf "%i " result
    0