--Author cire
let input = """
11
0 7 47 21 0 21 33 27
6 16 40 10 22 3 57 2
23 17 19 50 29 10 52 6
25 10 37 16 26 22 22 1
17 21 9 55 25 2 11 25
2 1 34 58 6 12 53 10
7 4 5 59 26 12 23 14
6 13 56 53 23 23 25 58
7 16 31 22 9 8 57 54
4 22 42 17 12 19 41 25
8 19 2 27 22 7 32 17
"""

let lines = input.split(separator: "\n")
guard let first = lines.first, let cases = Int(first) else {
    exit(0)
}

let secondsInMinute = 60
let secondsInHour = 60 * secondsInMinute
let secondsInDay = 24 * secondsInHour

func divmod(_ x: Int, _ y: Int) -> (quot: Int, rem: Int) {
    return (x / y, x % y)
}

func toSeconds(days: Int, hours: Int, mins: Int, secs: Int) -> Int {
    return days * secondsInDay + hours * secondsInHour + mins * secondsInMinute + secs
}

func toDate(seconds: Int) -> (days: Int, hours: Int, mins: Int, secs: Int) {
    var s = seconds
    var ans: (days: Int, hours: Int, mins: Int, secs: Int)
    (ans.days, s) = divmod(s, secondsInDay)
    (ans.hours, s) = divmod(s, secondsInHour)
    (ans.mins, s) = divmod(s, secondsInMinute)
    ans.secs = s
    return ans
    
}

var answer = ""
for line in lines[1...] {
    let ints = line.split(separator: " ").map({ Int($0)! })
    let (day1, hour1, min1, sec1, day2, hour2, min2, sec2) = (ints[0], ints[1], ints[2], ints[3], ints[4], ints[5], ints[6], ints[7])
    let t1 = toSeconds(days: day1, hours: hour1, mins: min1, secs: sec1)
    let t2 = toSeconds(days: day2, hours: hour2, mins: min2, secs: sec2)
    let date = toDate(seconds: t2 - t1)
    answer += "(\(date.days) \(date.hours) \(date.mins) \(date.secs)) "
    
}

print(answer.trimmingCharacters(in: .whitespaces))
