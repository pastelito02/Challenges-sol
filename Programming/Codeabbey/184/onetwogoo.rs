//Author onetwogoo
use std::io;

fn main() {
    let tn = read_ints()[0];
    for _ in 0..tn {
        let parts: Vec<_> = read_line().split_whitespace().map(|x|x.to_string()).collect();
        let m = parts[0].parse::<i32>().unwrap();
        let k = parts[1].parse::<i32>().unwrap();
        let normal = parts[2] == "n";
        if normal {
            if m % (k+1) == 0 {
                print!("0 ");
            } else {
                print!("{} ", m % (k+1));
            }
        } else {
            if (m-1) % (k+1) == 0 {
                print!("0 ");
            } else {
                print!("{} ", (m-1) % (k+1));
            }
        }
    }
}

fn read_line() -> String {
    let mut stdin = io::stdin();
    let mut line = String::new();
    stdin.read_line(&mut line).unwrap();
    line.trim().to_string()
}

fn read_ints() -> Vec<i32> {
    read_line()
        .split_whitespace()
        .map(|s| s.parse::<i32>().ok().unwrap())
        .collect()
}