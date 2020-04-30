//Author iksfclolr
use std::f64::consts::E;
use std::fmt::Write;
fn main() {
  let argc = {
    let mut a = String::new();
    std::io::stdin().read_line(&mut a).unwrap();
    a.trim().parse::<usize>().unwrap()
  };
  let mut out_string = String::new();
  for _ in 0..argc {
    let mut min = 0_f64;
    let mut max = 100_f64;
    let mut mid = get_mid(&min, &max);
    let target = 0_f64;
    let vec: Vec<f64> = {
      let mut a = String::new();
      std::io::stdin().read_line(&mut a).unwrap();
      a.split_whitespace()
        .map(|x| x.trim().parse::<f64>().unwrap())
        .collect()
    };
    let mut a;
    while {
      a = calc(mid, &vec[0], &vec[1], &vec[2], &vec[3]);
      if a < target {
        min = mid;
      }
      if a > target {
        max = mid;
      }
      mid = get_mid(&min, &max);
      cust_round(a) != target
    }
    {}
    write!(&mut out_string, "{} ", mid).unwrap();
  }
  println!("\n{}", out_string);
}
fn cust_round(x: f64) -> f64 {
  let a = 10_i32.pow(9) as f64;

  (x * a).round() / a
}
fn get_mid(min: &f64, max: &f64) -> f64 {
  (max + min) / 2_f64
}
fn calc(x: f64, a: &f64, b: &f64, c: &f64, d: &f64) -> f64 {
  (a * x) + (b * x.powf(3_f64).sqrt()) - (c * E.powf((-x) / 50_f64)) - d
}
