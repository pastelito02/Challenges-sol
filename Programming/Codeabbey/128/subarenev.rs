//Author subarenev
extern crate num_bigint;

use num_bigint::BigInt;

fn getinput() -> String {
  let mut userinput = String::new();
  std::io::stdin()
    .read_line(&mut userinput)
    .expect("Cannot get input.");
  userinput
}

// N! / (K!(N-K)!)
// Item_var = [N, K]
fn calc_combinations(item: String) {
  let item_vars: Vec<i64> = item.split_whitespace()
    .map(|x| x.trim().parse::<i64>().unwrap())
    .collect();
  let (n, k): (i64, i64) = (item_vars[0], item_vars[1]);

  let num_of_com: BigInt = factorial(n) / (factorial(k) * factorial(n - k));
  print!("{} ", num_of_com);
}

// Do our own factorial function just for the fun of it.
fn factorial(x: i64) -> BigInt {
  let mut current: BigInt = BigInt::from(1);
  for i in 1..=x {
    current *= i;
  }
  current
}

fn main() {
  let total_items: u8 = getinput()
    .trim()
    .parse::<u8>()
    .unwrap();

  let mut item_vector: Vec<String> = Vec::new();
  for _x in 0..total_items {
    item_vector.push(getinput());
  }

  for item in item_vector.iter() {
    calc_combinations(item.to_string());
  }

  println!("");
  getinput();
}
