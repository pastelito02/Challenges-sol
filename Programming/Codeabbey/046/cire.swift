--Author cire
let input = """
11
6 3 4 7 8 9 2 1 5
3 9 4 5 8 1 7 6 2
1 5 2 8 4 9 3 7 6
3 6 2 1 8 4 7 9 5
6 5 8 4 1 9 2 7 3
1 4 9 7 2 5 8 3 6
7 4 3 9 2 1 8 6 5
3 8 2 1 5 6 4 7 9
7 4 2 6 3 1 8 5 9
9 2 8 1 3 5 6 7 4
3 6 1 4 9 2 7 5 8
"""

let wins = [
    0b111000000, 0b000111000, 0b000000111, // rows
    0b100100100, 0b010010010, 0b001001001, // cols
    0b100010001, 0b001010100               // diagnoals
]

struct tictactoe {
    var xs = 0
    var os = 0
    
    mutating func play(x: Bool, atPosition pos: Int) -> Bool {
        let mask = 1 << (pos - 1)
        if x {
            xs |= mask
        } else {
            os |= mask
        }
        let side = x ? xs : os
        for win in wins {
            if (win & side) == win {
                return true
            }
        }
        return false
    }
}

let lines = input.split(separator: "\n")
var answer = ""
for line in lines[1...] {
    let positions = line.split(separator: " ").map({ Int($0)! })
    var game = tictactoe()
    var moves = 0
    for pos in positions {
        let xsTurn = (moves & 1) == 0
        if game.play(x: xsTurn, atPosition: pos) {
            answer += "\(moves + 1) "
            break
        }
        moves += 1
    }
    if moves == 9 { // draw
        answer += "0 "
    }
    
}
print(answer.trimmingCharacters(in: .whitespaces))

