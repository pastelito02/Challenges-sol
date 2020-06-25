//Author alexandershinov
package main
import "fmt"

func main(){
    var N, step int
    fmt.Scanf("%d %d", &N, &step)
    A := make([]int, N)
    for i := 0; i < N; i++ {
        A[i] = i + 1
    }
    for i := 0; i < len(A); i++ {
        if i % step != step - 1 {
            A = append(A, A[i])
        }
    }
    fmt.Println(A[len(A)-1])
    
}