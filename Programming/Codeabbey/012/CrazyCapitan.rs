//Author CrazyCapitan
pub fn main() {
    let reader = std::io::stdin();
    let mut count = String::new();
    reader.read_line(&mut count).expect("Cloud not read your input");
    for _ in 0..count.trim().parse::<i32>().unwrap() {
        let mut line = String::new();
        reader.read_line(&mut line).expect("Cloud not read your input");
        let mut time_arr :  [i32;8] = [0;8];
        for (i,y) in line.split_whitespace().enumerate() {
            time_arr[i] = y.parse::<i32>().unwrap();
        }
        print!("(");
        let mut counter = 0;
        for x in &time_diff(time_arr) {
            if counter < 3 {
            print!("{} ",x);
            }else {
                print!("{}",x);
            }
            counter+=1;
        }
        print!(") ");
    }
    println!("");
}


fn time_diff(a : [i32;8]) -> [i32;4] {
    let time1 : i32 = a[0]*24*60*60 + a[1]*60*60 + a[2]*60 + a[3];
    let time2 : i32 = a[4]*24*60*60 + a[5]*60*60 + a[6]*60 + a[7];
    let mut travel_time = time2 - time1;
    let mut diff : [i32;4] = [0;4];
    diff[0] = travel_time / (24*60*60);
    travel_time = travel_time % (24*60*60);
    diff[1] = travel_time / (60*60);
    travel_time = travel_time % (60*60);
    diff[2] = travel_time / 60;
    travel_time = travel_time % 60;
    diff[3] = travel_time;
    diff
}
