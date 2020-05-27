//Author dmitriygo
package main

import (
    "bufio"
    "fmt"
    "os"
)

// Rotate String
// http://www.codeabbey.com/index/task_view/rotate-string

func main() {

    scanner := bufio.NewScanner(os.Stdin)

    var c int
    var text string

    for scanner.Scan() {

        fmt.Sscanf(scanner.Text(), "%d %s", &c, &text)
        if c > 0 {
            fmt.Printf("%s ", text[c:]+text[:c])
        } else {
            c = c * -1
            fmt.Printf("%s ", text[len(text) - c:]+text[:len(text) - c])
        }

    }
}

