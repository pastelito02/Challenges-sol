// Author alexandershinov
package main

import (
	"bytes"
	"fmt"
)

func findAB(x1, y1, x2, y2 int) (a, b int) {
	a = (y1 - y2) / (x1 - x2)
	b = y1 - a*x1
	return
}

func main() {
	var N, x1, y1, x2, y2 int
	var result bytes.Buffer
	fmt.Scanf("%d", &N)
	for i := 0; i < N; i++ {
		fmt.Scanf("%d %d %d %d", &x1, &y1, &x2, &y2)
		a, b := findAB(x1, y1, x2, y2)
		fmt.Fprintf(&result, "(%d %d) ", a, b)
	}
	fmt.Printf(result.String())
}
