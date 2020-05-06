//Author vodmin
package main

import (
	"fmt"
	"math"
)

func main() {
	var count int
	var stockName string
	for fmt.Scan(&count); count > 0; count-- {
		fmt.Scan(&stockName)
		vals := make([]float64, 14)
		for i := 0; i < 14; i++ {
			fmt.Scan(&vals[i])
		}
		if stdDev(vals) > aveMean(vals)/25 {
			fmt.Printf("%s ", stockName)
		}
	}
}

func stdDev(ar []float64) float64 {
	tmp := make([]float64, len(ar))
	copy(tmp, ar)
	M := aveMean(tmp)
	for i, _ := range tmp {
		tmp[i] = math.Pow(M-tmp[i], 2)
	}
	M = aveMean(tmp)
	return math.Sqrt(M)
}

func aveMean(ar []float64) float64 {
	var sum float64
	for _, val := range ar {
		sum += val
	}
	return sum / float64(len(ar))
}
