let getGrade = (a: int, b: int, c: int) => {
  switch ((a + b + c) / 3) {
  | x when x >= 90 => 'A'
  | x when x >= 80 => 'B'
  | x when x >= 70 => 'C'
  | x when x >= 60 => 'D'
  | _ => 'F'
  }
}
