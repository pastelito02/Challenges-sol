//Author ASuleymanov
package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

var (
	data  = bufio.NewReader(os.Stdin)
	count int
	ans   []string
)

func readLine() []string {
	s, err := data.ReadString('\n')
	if err != nil {
		panic(err)
	}
	return strings.Split(s[:len(s)-1], " ")
}

func main() {
	fmt.Scanf("%d", &count)
	for i := 0; i < count; i++ {
		arr := readLine()
		x1, _ := strconv.ParseFloat(arr[0], 64)
		y1, _ := strconv.ParseFloat(arr[1], 64)
		x2, _ := strconv.ParseFloat(arr[2], 64)
		y2, _ := strconv.ParseFloat(arr[3], 64)
		x3, _ := strconv.ParseFloat(arr[4], 64)
		y3, _ := strconv.ParseFloat(arr[5], 64)
		a := math.Sqrt(math.Pow(x1-x2, 2) + math.Pow(y1-y2, 2))
		b := math.Sqrt(math.Pow(x2-x3, 2) + math.Pow(y2-y3, 2))
		c := math.Sqrt(math.Pow(x3-x1, 2) + math.Pow(y3-y1, 2))
		p := (a + b + c) / 2
		s := math.Sqrt(p * (p - a) * (p - b) * (p - c))
		str := strconv.FormatFloat(s, 'f', -1, 32)
		ans = append(ans, str)
	}
	fmt.Println(ans)
}
