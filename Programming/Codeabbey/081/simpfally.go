//Author simpfally
package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func BitCount(b int) int {
	var a uint64
	a = uint64(b)
	if b < 0 {
		a = a + uint64(2<<31)
	}
	c := 0

	for a > 0 {
		if (a & 1) == 1 {
			c++
		}
		a >>= 1
	}
	return c
}

func fn(a []int) []int {
	for i, v := range a {
		a[i] = BitCount(v)
	}
	return a
}

func main() {
	in := bufio.NewReader(os.Stdin)
	for {
		li, err := in.ReadString('\n')
		if err != nil {
			log.Fatalln("err:", err)
		}
		if len(li) < 2 {
			break
		}
		s := strings.Split(strings.TrimSpace(li), " ")

		nu := make([]int, 0, len(s))

		for i, n := range s {
			fl, err := strconv.ParseFloat(n, 64)
			if err != nil {
				fmt.Printf("%d: %s isn't a valid number\n", i+1, n)
				continue
			}

			nu = append(nu, int(fl))
		}
		fmt.Println(fn(nu))
	}
}
