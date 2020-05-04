//Author qoweilsjdfa
use super::parser;

pub fn main(input: String) -> String {

  let mut weighted_sums: Vec<i32> = Vec::new();

  for i in parser::parse_columns(input) {
    let mut weighted_sum: i32 = 0;
    for (c_index, c) in i.chars().enumerate() {
      let c = c.to_string().parse::<i32>().unwrap();
      let c_index = (c_index + 1) as i32;
      weighted_sum += c * c_index;
    }
    weighted_sums.push(weighted_sum);
  }

  weighted_sums.iter().map(|&x| x.to_string()).collect::<Vec<_>>().join(" ")

}
