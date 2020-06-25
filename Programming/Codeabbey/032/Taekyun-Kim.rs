//Author Taekyun Kim
use std::fmt;
use std::env;
use std::io;
use std::fs;
use std::collections::HashSet;

// general functions

fn get_first_arg() -> Option<String> {
    let args: Vec<String> = env::args().collect();
    args.get(1).map(|v| v.to_string())
}

fn read_by_line(filename: &str) -> Result<Vec<String>, io::Error> {
    let contents = fs::read_to_string(filename)?;
    let result: Vec<String> = contents.lines()
        .map(|s| s.to_string())
        .collect();
    Ok(result)
}

// generalize over numeric types
fn parse_str_as_numeric<T>(s: &str) -> Vec<T> where 
T: std::str::FromStr {
    let result = s.split_whitespace()
        .map(|w| w.parse().unwrap_or_else(|_| panic!("Cannot parse as intended."))) 
        .collect();
    result
}

fn print_vec<T: fmt::Display>(v: &Vec<T>){
    for elem in v {
        print!("{} ", elem);
    }
    print!("\n");
}

fn vec_to_tup<T: Clone>(v: &Vec<T>) -> (T, T) {
    (v[0].clone(), v[1].clone())
}

fn vec_to_tup3<T: Clone>(v: &Vec<T>) -> (T, T, T) {
    (v[0].clone(), v[1].clone(), v[2].clone())
}

fn get_sorted<T: Ord+Clone>(xs: Vec<T>) -> Vec<T> {
    let mut ys = xs.clone();
    ys.sort();
    ys
}

fn print_sep() {
    println!("{}", "-".repeat(65));
}

// problem specific 

// reference
// https://en.wikipedia.org/wiki/Josephus_problem
fn josepheus(n: usize, k: usize) -> usize {
    match n {
        1 => 1,
        _ => (josepheus(n - 1, k) + k - 1) % n + 1,
    }
}

mod tests {
    use super::*;

    #[test]
    fn test_5_2() {
        assert_eq!(josepheus(5, 2), 3);
    }

    #[test]
    fn test_7_3() {
        assert_eq!(josepheus(7, 3), 4);
    }

    #[test]
    fn test_10_3() {
        assert_eq!(josepheus(10, 3), 4);
    }
}

fn main() {
    // read input

    let filename = get_first_arg().unwrap();
    let input = read_by_line(filename.as_str()).unwrap();

    // parse 
    let data: Vec<usize> = parse_str_as_numeric(&input[0]);
    println!("{:?}", data);
    let (n, k) = vec_to_tup(&data);
    
    // main part
    let result = josepheus(n, k);
    println!("{}", result);

}

