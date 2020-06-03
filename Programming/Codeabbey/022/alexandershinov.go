//Author alexandershinov
package main
import (
    "fmt"
    "bytes"
)

func max(a, b int) (m int) {
    m = a
    if b > a {
        m = b
    }
    return
}

func findTime(a, b, n int) (t int) {
    var lastA, lastB int
    for i := 0; i < n; i++ {
        if lastA + a < lastB + b {
            lastA += a
        } else {
            lastB += b
        }
    }
    t = max(lastA, lastB)
    return
}

func main(){
    var N, a, b, n int
    var result bytes.Buffer
    fmt.Scanf("%d", &N)
    for i := 0; i < N; i++ {
        fmt.Scanf("%d %d %d", &a, &b, &n)
        t := findTime(a, b, n)
        fmt.Fprintf(&result, "%d ", t)
    }
    fmt.Printf(result.String())
}