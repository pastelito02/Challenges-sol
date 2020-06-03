//Author CrazyCapitan
pub fn main() {
    let reader = std::io::stdin();
    let mut count : String = String::new();
    reader.read_line(&mut count).ok();
    let mut nums : String = String::new();
    let mut rows : [i32;2] = [0,0];
    for _ in 0..count.trim().parse::<i32>().unwrap() {
        nums.clear();
        reader.read_line(&mut nums).ok();
        for (i,x) in nums.split_whitespace().enumerate() {
            rows[i] = x.parse::<i32>().unwrap();
        }
        let g = gcd(rows[0],rows[1]);
        let l = (rows[0]*rows[1])/g;
        print!("({} {}) ",g,l);
    }
    println!("");
}

fn gcd(a_p : i32, b_p: i32) -> i32 {
    let mut a = a_p;
    let mut b = b_p;
    while a != b {
        if a > b {
            a = a - b;
        }else{
            b = b - a;
        }
    }
    a
}
