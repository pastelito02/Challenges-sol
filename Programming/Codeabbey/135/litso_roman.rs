//Author litso_roman
use std::io;

macro_rules! hashmap {
    ($( $key: expr => $val: expr ),*) => {{
         let mut map = ::std::collections::HashMap::new();
         $( map.insert($key, $val); )*
         map
    }}
}

fn main() {
    let encoding = hashmap![
        ' ' => "11",
        't' => "1001",
        'n' => "10000",
        's' => "0101",
        'r' => "01000",
        'd' => "00101",
        '!' => "001000",
        'c' => "000101",
        'm' => "000011",
        'g' => "0000100",
        'b' => "0000010",
        'v' => "00000001",
        'k' => "0000000001",
        'q' => "000000000001",
        'e' => "101",
        'o' => "10001",
        'a' => "011",
        'i' => "01001",
        'h' => "0011",
        'l' => "001001",
        'u' => "00011",
        'f' => "000100",
        'p' => "0000101",
        'w' => "0000011",
        'y' => "0000001",
        'j' => "000000001",
        'x' => "00000000001",
        'z' => "000000000000"
    ];

    let mut buf = String::new();
    io::stdin()
        .read_line(&mut buf)
        .expect("Failed to read line");

    let bytes_str = buf.trim_right()
        .chars()
        .map(|c| *encoding.get(&c).unwrap())
        .collect::<Vec<_>>()
        .concat();

    for chunk in bytes_str.as_bytes().chunks(8) {
        let a = i32::from_str_radix(&format!("{:0<8}", String::from_utf8_lossy(chunk)), 2).unwrap();
        print!("{:0>2X?} ", a);
    }
    println!();
}
