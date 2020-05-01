//Author serviceable
extern crate input;

use input::Scan;

struct Problem017 { x: u32, steps: usize }

fn main() {
  input::n_cases_from_count(parse).solve(sqrt_approx).answer_line();
}

fn parse<S: Scan>(scanner: &mut S) -> input::Result<Problem017> {
  let (x, steps) = try!(scanner.next_2());
  Ok(Problem017 { x: x, steps: steps })
}

fn sqrt_approx(p: Problem017) -> f64 {
  let mut r = 1_f64;
  let x = p.x as f64;
  for _ in 0..p.steps {
    r = (r + (x / r)) / 2_f64;
  }
  r
}
