//Author serviceable
extern crate input;
extern crate num;

use input::Scan;
use num::Complex;

type Problem038 = (i32, i32, i32);

fn main() {
    input::n_cases_from_count(|s| s.next_3())
        .solve(solve)
        .answer_with_sep("; ");
}

// I have zero interest in writing all of the numeric traits for complex
// numbers, so I'm using the officially-distributed external num crate to
// represent the complex number introduced by a potential sqrt() on a negative
// number.
fn solve(p: Problem038) -> String {
    let (a, b, c) = p;
    let denom = 2 * a;
    let sq = b.pow(2) - 4*a*c;
    let sqrt = if sq < 0 {
        Complex::new(0, f32::sqrt(sq.abs() as f32) as i32)
    } else {
        Complex::new(f32::sqrt(sq as f32) as i32, 0)
    };
    let x1 = (-b + sqrt) / denom;
    let x2 = (-b - sqrt) / denom;
    format!("{} {}", format_complex(x1), format_complex(x2))
}

// For display, remove the imaginary part of an entirely-real number.
fn format_complex(x: Complex<i32>) -> String {
    if x.im == 0 {
        return format!("{}", x.re);
    }
    format!("{}", x)
}
