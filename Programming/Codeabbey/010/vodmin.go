// Author vodmin
package main

import "fmt"

func main() {
	var count, x1, y1, x2, y2 int
	fmt.Scan(&count)
	for i := 0; i < count; i++ {
		fmt.Scanf("%d %d %d %d\n", &x1, &y1, &x2, &y2)
		var a, aPos, aNeg int
		for a < 10 {
			if y1-aPos*x1 == y2-aPos*x2 {
				a = aPos
				break
			} else if y1-aNeg*x1 == y2-aNeg*x2 {
				a = aNeg
				break
			}
			aPos++
			aNeg--
		}
		// b = y1 - a*x1
		fmt.Printf("(%d %d) ", a, y1-a*x1)
	}
}
