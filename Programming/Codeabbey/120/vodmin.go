//Author vodmin
package main

import "fmt"

func main() {
    var count, dig int
    var ar []int
    fmt.Scan(&count)

    for i := 0; i < count; i++ {
        fmt.Scan(&dig)
        ar = append(ar, dig)
    }
    ssort(ar)
}

func ssort(ar []int) int {
    for i := len(ar) - 1; i > 0; i-- {
        var max, id int
        for k := 0; k <= i; k++ {
            if max <= ar[k] {
                max = ar[k]
                id = k
            }
        }
        ar[i], ar[id] = ar[id], ar[i]
        fmt.Printf("%d ", id)
    }
    return 0
}
