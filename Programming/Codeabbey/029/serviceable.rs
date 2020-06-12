//Author serviceable
extern crate input;

use input::Scan;

fn main() {
    input::one_case(parse).solve(solve).answer_line();
}

fn parse<S: Scan>(s: &mut S) -> input::Result<Vec<u32>> {
    s.next_n_from_count()
}

// We've already implemented bubble sort, so rather than implement it again for
// this exercise, let's get familiar with Rust's sorting facilities. We
// annotate each value with its index, sort by the values, then collect the
// indices.
fn solve(v: Vec<u32>) -> String {
    let mut iv = v.into_iter().enumerate().collect::<Vec<_>>();
    iv.sort_by_key(|&(_, v)| v);
    iv.iter()
        .map(|&(i, _)| format!("{}", i+1))
        .collect::<Vec<_>>()
        .join(" ")
}
