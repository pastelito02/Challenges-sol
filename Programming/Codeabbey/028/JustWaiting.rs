//Author JustWaiting
use std::io;
use std::error::Error;

fn main() {
    match bmi() {
        Ok(values) => {
            for val in values {
                print!("{} ", val);
            }
            println!("");
        },
        Err(e) => println!("Error: {}", e)
    };
}

fn bmi() -> Result<Vec<&'static str>, Box<Error>> {
    let calc = |w: u8, h: f32| w as f32 / (h.powi(2));
    let test_cnt = try!(read_test_count());

    let mut ret = Vec::new();
    for _ in 0..test_cnt {
        let mut line_str = String::new();
        try!(io::stdin().read_line(&mut line_str));
        let mut itr = line_str.trim().split_whitespace().take(2);

        let weight = try!(try!(itr.nth(0).ok_or("No weight entered.")).parse());
        let height = try!(try!(itr.nth(0).ok_or("No height entered.")).parse());
        ret.push(match calc(weight, height) {
            x if x < 18.5 => "under",
            x if x < 25.0 => "normal",
            x if x < 30.0 => "over",
            _ => "obese"
        });
    }
    return Ok(ret);
}

fn read_test_count() -> Result<u8, Box<Error>> {
    let mut line_cnt_s = String::new();
    try!(io::stdin().read_line(&mut line_cnt_s));
    Ok(try!(line_cnt_s.trim().parse()))
}