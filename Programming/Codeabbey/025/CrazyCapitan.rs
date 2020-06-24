//Author CrazyCapitan
pub fn main() {
    let reader = std::io::stdin();
    let mut count = String::new();
    let mut line = String::new();
    let mut arr : [i64;5] = [0;5];
    reader.read_line(&mut count).ok();
    for _ in 0..count.trim().parse::<i64>().unwrap() {
        line.clear();
        reader.read_line(&mut line).ok();
        for (i,x) in line.split_whitespace().enumerate() {
            arr[i] = x.parse::<i64>().unwrap();
        }
        print!("{} ",gen(arr[0],arr[1],arr[2],arr[3],arr[4]));
    }
    println!("");
}

fn gen(a:i64,c:i64,m:i64,x0:i64, n:i64) -> i64{
    let mut x_next: i64 = x0;
    for _ in 0..n {
        x_next = (a * x_next + c) % m;
    }
    x_next
}
