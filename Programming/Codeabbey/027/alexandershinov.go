//Author alexandershinov
package main
import "fmt"

func main(){
    var counter, N int
    fmt.Scanf("%d", &N)
    A := make([]int, N)
    for i := 0; i < N; i++ {
        fmt.Scanf("%d", &A[i])
    }
    localCounter := 1
    globalCounter := 0
    for localCounter > 0 {
        localCounter = 0
        for i := 1; i < N; i++ {
            if A[i] < A[i-1] {
                A[i-1] += A[i]
                A[i] = A[i-1] - A[i]
                A[i-1] -= A[i]
                localCounter++
            }
        }
        globalCounter += localCounter
        counter++
    }
    
    fmt.Printf("%d %d", counter, globalCounter)
}