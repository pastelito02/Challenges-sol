//Author serviceable
extern crate input;
extern crate abbey;

use input::Scan;

// Use our primes iterator from Problem 61.
use abbey::primes::Primes;

fn main() {
  input::n_cases_from_count(|s| s.next()).solve(solve).answer_line();
}

fn solve(n: u64) -> String {
  prime_factors(n).iter()
    .map(|n| format!("{}", n))
    .collect::<Vec<_>>()
    .join("*")
}

fn prime_factors(mut n: u64) -> Vec<u64> {
  let mut fs = vec![];
  let mut ps = PrimesMemo::new();
  while n != 1 {
    let p = ps.iter().find(|p| n % *p  == 0).unwrap();
    fs.push(p);
    n /= p;
  }
  fs
}

// A wrapper around Primes that keeps a vector of the primes generated so far
// so that repeated iterations don't repeat work.
struct PrimesMemo {
  primes: Primes,
  memo: Vec<u64>,
}

impl<'a> PrimesMemo {
  fn new() -> Self {
    PrimesMemo { primes: Primes::new(), memo: vec![] }
  }

  fn iter(&'a mut self) -> PrimesIter<'a> {
    PrimesIter {
      primes: &mut self.primes,
      memo: &mut self.memo,
      i: 0,
    }
  }
}

// An iteration over primes that stores the generated primes as it goes.
struct PrimesIter<'a> {
  primes: &'a mut Primes,
  memo: &'a mut Vec<u64>,
  i: usize,
}

impl<'a> Iterator for PrimesIter<'a> {
  type Item = u64;

  fn next(&mut self) -> Option<Self::Item> {
    if self.i == self.memo.len() {
      self.memo.push(self.primes.next().unwrap());
    }
    let p = self.memo[self.i];
    self.i += 1;
    Some(p)
  }
}
