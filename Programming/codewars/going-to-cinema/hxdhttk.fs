//hxdhttk
let movie (card: int) (ticket: int) (perc: float): int =
    let systemA time =
        ticket * time
    let systemB time =
        [for x in 1 .. time ->
            (float ticket) * (perc ** (float x))]
        |> List.sum
        |> (+) (float card)
    Seq.initInfinite (fun idx -> idx)
    |> Seq.tail
    |> Seq.find (fun t -> (int (ceil (systemB t))) < (systemA t))
