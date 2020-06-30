//Author onetwogoo
use std::io;
use std::str::FromStr;
use std::f64::consts::PI;
fn main() {
    read_line();
    let mut line = read_line();
    let mut x = 0.0;
    let mut y = 0.0;
    while line.starts_with("go") {
        {
            let parts: Vec<_> = line.split_whitespace().collect();
            let len = parts[1].parse::<f64>().unwrap();
            let angle = parts[5].parse::<f64>().unwrap();
            let rad = (90.0 - angle) / 180.0 * PI;
            x += rad.cos() * len;
            y += rad.sin() * len;
        }
        line = read_line();
    }
    print!("{:.0} {:.0}", x, y);
}

fn read_line() -> String {
    let mut stdin = io::stdin();
    let mut line = String::new();
    stdin.read_line(&mut line).unwrap();
    line.trim().to_string()
}

fn read_many<T: FromStr>() -> Vec<T> {
    read_line()
        .split_whitespace()
        .map(|s| s.parse().ok().unwrap())
        .collect()
}
