//Author vodmin
package main

import "fmt"

func main() {
    var rows, cols, counter int
    fmt.Scan(&rows, &cols)

    slice2D := make([][]string, rows)
    for i := 0; i < rows; i++ {
        slice2D[i] = make([]string, cols)
        for j, _ := range slice2D[i] {
            fmt.Scan(&slice2D[i][j])
        }
    }
    goToGold(slice2D, 0, 0, &counter)
    fmt.Println(counter)
}

func goToGold(slice2D [][]string, row, col int, counter *int) bool {
    switch slice2D[row][col] {
    case "X":
        return true
    case "$":
        *counter++
    }
    if len(slice2D) > row+1 {
        goToGold(slice2D, row+1, col, counter)
    }
    if len(slice2D[row]) > col+1 {
        goToGold(slice2D, row, col+1, counter)
    }
    return true
}
