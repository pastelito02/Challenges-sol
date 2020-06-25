//Author vodmin
package main

import "fmt"
import "bufio"
import "os"
import "strings"
import "strconv"

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Scan()
    RND := strings.Split(scanner.Text(), " ")
    ar := make([]string, 52)
    id := 0
    for _, a := range "CDHS" {
        for _, b := range "A23456789TJQK" {
            ar[id] = string(a) + string(b)
            id++
        }
    }
    for i, _ := range ar {
        seq, _ := strconv.Atoi(RND[i])
        seq %= 52
        ar[seq], ar[i] = ar[i], ar[seq]
    }
    fmt.Println(ar)
}
