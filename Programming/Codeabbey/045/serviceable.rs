//Author serviceable
extern crate input;

use input::Scan;
use std::fmt;

fn main() {
    input::one_case(|s| s.next_n(52)).solve(shuffle).answer_line();
}

fn shuffle(rs: Vec<usize>) -> String {
    let mut deck = Deck::new();
    for (i, r) in rs.iter().enumerate() {
        let j = r % 52;
        deck.swap(i, j);
    }
    format!("{}", deck)
}

#[derive(Debug)]
struct Deck {
    cards: Vec<Card>
}

#[derive(Clone, Debug)]
enum Card {
    Ace(&'static Suit),
    Rank(&'static Suit, u8),
    Ten(&'static Suit),
    Jack(&'static Suit),
    Queen(&'static Suit),
    King(&'static Suit),
}

#[derive(Clone, Debug)]
enum Suit { Clubs, Diamonds, Hearts, Spades }

static SUITS: [Suit; 4] = [
    Suit::Clubs,
    Suit::Diamonds,
    Suit::Hearts,
    Suit::Spades,
];

impl Deck {
    fn new() -> Deck {
        let mut cards = Vec::with_capacity(52);
        for s in SUITS.iter() {
            for r in 1 .. 14 {
                cards.push(match r {
                    1 => Card::Ace(s),
                    n @ 2 ... 9 => Card::Rank(s, n),
                    10 => Card::Ten(s),
                    11 => Card::Jack(s),
                    12 => Card::Queen(s),
                    13 => Card::King(s),
                    _ => panic!("unreachable")
                });
            }
        }
        Deck { cards: cards }
    }

    fn swap(&mut self, i: usize, j: usize) {
        self.cards.swap(i, j);
    }
}

impl fmt::Display for Deck {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        for (i, c) in self.cards.iter().enumerate() {
            if i > 0 {
                try!(write!(f, " "));
            }
            try!(write!(f, "{}", c));
        }
        Ok(())
    }
}

impl fmt::Display for Card {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            Card::Ace(s) => write!(f, "{}{}", s, "A"),
            Card::Rank(s, n) => write!(f, "{}{}", s, n),
            Card::Ten(s) => write!(f, "{}{}", s, "T"),
            Card::Jack(s) => write!(f, "{}{}", s, "J"),
            Card::Queen(s) => write!(f, "{}{}", s, "Q"),
            Card::King(s) => write!(f, "{}{}", s, "K"),
        }
    }
}

impl fmt::Display for Suit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", match *self {
            Suit::Clubs => "C",
            Suit::Diamonds => "D",
            Suit::Hearts => "H",
            Suit::Spades => "S",
        })
    }
}
