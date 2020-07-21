/*villesau*/
let findBiggest = ([a, b, c]) =>
  List.fold_left(
    (acc, num) =>
      switch (acc, num) {
      | (_, 1) => acc + num
      | (1, _) => acc + num
      | _ => acc * num
      },
    a,
    [b, c],
  );
let expressionMatter = (a: int, b: int, c: int) => {
  let biggest = findBiggest([a, b, c]);
  let biggestreversed = findBiggest([c, b, a]);
  biggest > biggestreversed ? biggest : biggestreversed;
};
