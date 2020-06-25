--Author cire
let input = """
50 16
"""

let ints = input.split(separator: " ").map({ Int($0)! })
let (n, k) = (ints[0], ints[1])
var alive = [Int](1...n)
var killAt = k - 1
while true {
    alive.remove(at: killAt)
    if alive.count == 1 {
        break
    }
    killAt = (killAt + k - 1) % alive.count
}
print("\(alive[0])")
