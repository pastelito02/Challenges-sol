/*jtr109*/
use std::collections::HashMap;

const FRUITS: &str = "
1-kiwi
2-pear
3-kiwi
4-banana
5-melon
6-banana
7-melon
8-pineapple
9-apple
";

fn _sum(n: u32) -> u32 {
    match n {
        0..=9 => n,
        _ => n % 10 + _sum(n / 10),
    }
}

fn _subtract_sum(n: u32) -> u32 {
    match n {
        1..=9 => n,
        _ => _subtract_sum(n - _sum(n)),
    }
}

fn subtract_sum(n: u32) -> &'static str {
    let fruit_map: HashMap<u32, &str> = FRUITS
        .trim()
        .split("\n")
        .map(|line| {
            let pair = line.split("-").collect::<Vec<&str>>();
            (pair[0].parse::<u32>().unwrap(), pair[1])
        })
        .collect();
    fruit_map.get(&_subtract_sum(n)).unwrap()
}
