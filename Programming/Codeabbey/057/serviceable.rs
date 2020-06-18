//Author serviceable
extern crate input;

use input::Scan;

fn main() {
    input::one_case(|s| s.next_n_from_count()).solve(smooth).answer_line();
}

fn smooth(xs: Vec<f64>) -> String {
    let mut smoothed = Vec::with_capacity(xs.len());
    smoothed.push(format(xs[0]));
    smoothed.extend(xs.windows(3).map(|w| {
        format((w[0] + w[1] + w[2]) / 3.0)
    }));
    smoothed.push(format(xs[xs.len()-1]));
    smoothed.join(" ")
}

fn format(x: f64) -> String {
    format!("{:.7}", x)
}
