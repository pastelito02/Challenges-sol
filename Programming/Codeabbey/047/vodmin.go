//Author vodmin
package main

import "fmt"
import "os"
import "bufio"
import "strings"

func main() {
    var count, k int
    abc := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    scanner := bufio.NewScanner(os.Stdin)
    for fmt.Scan(&count, &k); count > 0; count-- {
        cba := string(abc[k:]) + string(abc[:k])
        scanner.Scan()
        line := scanner.Text()
        for _, letter := range line {
            pos := strings.Index(cba, string(letter))
            if pos > -1 {
                fmt.Printf("%s", string(abc[pos]))
            } else {
                fmt.Printf("%s", string(letter))
            }
        }
        fmt.Printf("%s", " ")
    }

}
