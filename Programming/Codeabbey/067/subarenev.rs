//Author subarenev
extern crate num;

use std::io;
use num::BigInt;

fn getinput() -> String {
  let mut userinput = String::new();
  io::stdin().read_line(&mut userinput)
    .expect("Failed to read line!");
  userinput
}

fn fib(max: BigInt) -> Vec<BigInt> {
  let mut sequence: Vec<BigInt> = vec![BigInt::from(0), BigInt::from(1)];
  let mut counter = 2;

  while *sequence.last().unwrap() != max {
    let new_fib: BigInt = &sequence[counter - 2] + &sequence[counter - 1];
    sequence.push(new_fib);
    counter += 1;
  }

  sequence
}

fn main() {
  let amount = getinput().trim().parse::<i32>().unwrap();
  let mut given_fibs = Vec::new();

  for _ in 0..amount {
    let mut temp = String::new();
    io::stdin().read_line(&mut temp)
      .expect("Failed to read line!");
    given_fibs.push(temp.trim().parse::<BigInt>().unwrap());
  }

  let fib_max = given_fibs.iter().max().unwrap();
  let fib_seq: Vec<BigInt> = fib(fib_max.clone());

  for num in given_fibs.clone() {
    for i in 0..fib_seq.len() {
      if num == fib_seq[i as usize] {
        print!("{} ", i);
      }
    }
  }
}
