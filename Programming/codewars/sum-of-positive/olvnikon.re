/*olvnikon*/
let positiveSum = (arr: list(int)) => List.fold_left(
  (acc, num) => num > 0 ? acc + num : acc, 0, arr
);
