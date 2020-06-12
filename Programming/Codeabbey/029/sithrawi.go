//Author sithrawi
package main

import (
    "fmt"
)

type data struct {
    val, idx int
}

func main() {
    var n int
    fmt.Scanln(&n)
    arr := make([]data, n)
    for j := 0; j < n; j++ {
        arr[j].idx = j + 1
        fmt.Scan(&arr[j].val)
    }
    arr = bubble(arr)
    for _, v := range arr {
        fmt.Print(v.idx, " ")
    }
}

func bubble(arr []data) []data {
    swap := true
    for swap {
        swap = false
        for i := 0; i < len(arr)-1; i++ {
            if arr[i].val > arr[i+1].val {
                arr[i], arr[i+1] = arr[i+1], arr[i]
                swap = true
            }
        }
    }
    return arr
}
