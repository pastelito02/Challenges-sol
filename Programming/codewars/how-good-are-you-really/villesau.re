let betterThanAverage = (classPoints: array(int), yourPoints: int) =>
  classPoints
  |> Array.fold_left((+), 0)
  |> Js.Int.toFloat
  |> (a => a /. (classPoints |> Array.length |> Js.Int.toFloat))
  |> (>=)(yourPoints |> Js.Int.toFloat);
