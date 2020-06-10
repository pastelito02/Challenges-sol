//Author istudent
func simpleMap() {
    board := map[coor]bool{}
    for i := 0; i < 5; i++ {
        var str string
        fmt.Scanf("%s", &str)
        for j := 0; j < 7; j++ {
            if str[j:j+1] == "X" {
                board[coor{x: i, y: j}] = true
            }
        }
    }
    for step := 0; step < 5; step++ {
        newBoard := map[coor]bool{}
        for el := range board {
            for i := -1; i < 2; i++ {
                for j := -1; j < 2; j++ {
                    elForCheck := coor{x: el.x + i, y: el.y + j}
                    numOfLive := countNeighborsInMap(board, elForCheck)
                    _, cond := board[elForCheck]
                    if (cond && (numOfLive == 2 || numOfLive == 3)) || (!cond && numOfLive == 3) {
                        if _, ok := newBoard[elForCheck]; !ok {
                            newBoard[elForCheck] = true
                        }
                    }
                }
            }
        }
        fmt.Print(len(newBoard), " ")
        board = newBoard
    }
}

func countNeighborsInMap(m map[coor]bool, el coor) (counter int) {
    for i := -1; i < 2; i++ {
        for j := -1; j < 2; j++ {
            neighbor := coor{x: el.x + i, y: el.y + j}
            if neighbor == el {
                continue
            }
            if _, ok := m[neighbor]; ok {
                counter++
            }
        }
    }
    return
}