//Author motkov.kirill
package main

import (
    "fmt"
    "math"
)

func Round(f float64) float64 {
    return math.Floor(f + .5)
}

func main() {
    var s string
    var a, b, x, y float64 = 0, 0, 0, 0
    for {
        fmt.Scanf("%s", &s)
        if s == "Stand" {
            fmt.Scanf("at the pole with the plaque %s\n", &s)
        } else if s == "go" {
            fmt.Scanf("%f feet by azimuth %f\n", &a, &b)
            x = x + a*math.Sin(b*(math.Pi/180))
            y = y + a*math.Cos(b*(math.Pi/180))
        } else {
            break
        }
    }
    fmt.Printf("%d %d", int(Round(x)), int(Round(y)))
}