//Author motkov.kirill
package main

import "fmt"

func main() {
    var testcount, a, b, c, d, a2, b2, c2, d2, timediff int
    fmt.Scanf("%d\n", &testcount)
    for i := 0; i < int(testcount); i++ {
        fmt.Scanf("%d %d %d %d %d %d %d %d\n", &a, &b, &c, &d, &a2, &b2, &c2, &d2)
        timediff = (a2*24*60*60 + b2*60*60 + c2*60 + d2) - (a*24*60*60 + b*60*60 + c*60 + d)
        fmt.Printf("(%d %d %d %d) ", int(timediff/(24*60*60)), int(timediff%(24*60*60)/(60*60)), int(timediff%(24*60*60)%(60*60)/60), timediff%(24*60*60)%(60*60)%60)
    }
}
