//Author litso_roman
use std::io::{self, BufRead};

fn check_winner(field: &[bool; 10]) -> bool {
    // check horisontals
    if (field[1] && field[4] && field[7]) || (field[2] && field[5] && field[8])
        || (field[3] && field[6] && field[9])
    {
        return true;
    }
    // check verticals
    if (field[1] && field[2] && field[3]) || (field[4] && field[5] && field[6])
        || (field[7] && field[8] && field[9])
    {
        return true;
    }
    // check diagonals
    if (field[1] && field[5] && field[9]) || (field[3] && field[5] && field[7]) {
        return true;
    }
    false
}

fn winner_turn(turns: Vec<usize>) -> usize {
    let mut player_one = [false; 10];
    let mut player_two = [false; 10];
    for (i, turn) in turns.iter().enumerate() {
        let player = if i % 2 == 0 {
            &mut player_two
        } else {
            &mut player_one
        };
        player[*turn] = true;
        if check_winner(player) {
            return i + 1;
        }
    }
    0
}

fn main() {
    let mut buffer = String::new();
    let input = io::stdin();
    input.read_line(&mut buffer).expect("Failed to read line");
    let number_of_tests = buffer.trim().parse().unwrap();

    for line in input.lock().lines().take(number_of_tests) {
        let mut turns: Vec<usize> = line.unwrap()
            .split_whitespace()
            .map(|n| n.parse().unwrap())
            .collect();
        print!("{} ", winner_turn(turns));
    }

    println!()
}
