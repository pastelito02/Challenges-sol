//Author badwolf10
package main

import (
    "bufio"
    "fmt"
    "log"
    "math"
    "os"
    "strconv"
    "strings"
)

func linearFunc(m, b float64) func(x float64) float64 {
    return func(x float64) float64 {
        return m*x + b
    }
}

func pointsDistance(x1 float64, y1 float64, x2 float64, y2 float64) float64 {
    return math.Sqrt(math.Pow((y2-y1), 2) + math.Pow((x2-x1), 2))
}

func getDistance(points [6]float64) float64 {
    p := points
    x1, y1, x2, y2, xp, yp := p[0], p[1], p[2], p[3], p[4], p[5]
    deltaX := x2 - x1
    deltaY := y2 - y1
    if deltaX == 0.0 {
        if math.Min(y1, y2) <= yp && yp <= math.Max(y1, y2) {
            return math.Abs(xp - x2)
        } else {
            return math.Min(
                pointsDistance(xp, yp, x2, y1), pointsDistance(xp, yp, x1, y1))
        }
    }
    if deltaY == 0.0 {
        if math.Min(x1, x2) <= xp && xp <= math.Max(x1, x2) {
            return math.Abs(yp - y2)
        } else {
            return math.Min(
                pointsDistance(xp, yp, x2, y1), pointsDistance(xp, yp, x1, y1))
        }
    }
    mseg := deltaY / deltaX
    mp := -1 / mseg
    bLineP1 := linearFunc(mp, y1-x1*mp)
    bLineP2 := linearFunc(mp, y2-x2*mp)
    bseg := y2 - mseg*x2
    bp := yp - xp*mp

    xi := (bseg - bp) / (mp - mseg)
    yi := mseg*xi + bseg
    if math.Min(bLineP1(xi), bLineP2(xi)) <= yi && yi <= math.Max(bLineP1(xi), bLineP2(xi)) {
        return pointsDistance(xp, yp, xi, yi)
    }
    return math.Min(
        pointsDistance(xp, yp, x2, y2), pointsDistance(xp, yp, x1, y1))
}

func main() {
    input, err := os.Open("DATA.lst")
    if err != nil {
        log.Fatal(err)
    }
    pointScanner := bufio.NewScanner(input)
    pointScanner.Scan()
    npoints, _ := strconv.Atoi(pointScanner.Text())
    for i := 0; i < npoints; i++ {
        pointScanner.Scan()
        var points [6]float64
        for j, val := range strings.Split(pointScanner.Text(), " ") {
            points[j], _ = strconv.ParseFloat(val, 64)
        }
        fmt.Printf("%+v\n", getDistance(points))
    }

}
