//Author istudent
package main

import "fmt"

func savingsCalculator() {
	var numOfInputs int
	fmt.Scanf("%d\n", &numOfInputs)
	for i := 0; i < numOfInputs; i++ {
		var s, r, p float64
		var counter int
		fmt.Scanf("%f %f %f\n", &s, &r, &p)
		p = p / 100
		for s < r {
			s = s + s*p
			counter++
		}
		fmt.Printf("%d ", counter)
	}
}
