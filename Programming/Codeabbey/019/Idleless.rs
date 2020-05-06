//Author Idleless
use std::io;

const open:&str = "([{<";
const close: &str = ")]}>";

fn main(){
  let mut cases = String::new();
  io::stdin().read_line(&mut cases).unwrap();
  let cases = cases.trim().parse::<i32>().unwrap();
  for _ in 0..cases{
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let mut stack = Vec::new();
    let mut matches = 1;
    for c in input_line.chars(){
      if open.contains(&c.to_string()){
        stack.push(c);
      }else if close.contains(&c.to_string()){
        let b = match stack.pop(){
          Some(v) => v,
          None => {matches = 0; break;},
        };
        if b == '(' && c == ')' || b == '[' && c == ']' || b == '{' && c == '}' || b == '<' && c == '>'{

        }else{
          matches = 0;
          break;
        }
      }
    }
    if stack.len() > 0 {
      matches = 0;
    }
    print!("{} ", matches);
  }
  println!("");
}
