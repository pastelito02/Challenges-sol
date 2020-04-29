//Author alexandershinov
package main

import (
	"bufio"
	"bytes"
	"fmt"
	"os"
)

const vowels = "aouiey"

func isVowel(c rune) bool {
	for _, v := range vowels {
		if c == v {
			return true
		}
	}
	return false
}

func countVowel(s string) (count uint64) {
	for _, c := range s {
		if isVowel(c) {
			count++
		}
	}
	return
}

func main() {
	var N int
	var s string
	var result bytes.Buffer
	fmt.Scanf("%d", &N)
	scanner := bufio.NewScanner(os.Stdin)
	for i := 0; i < N; i++ {
		scanner.Scan()
		s = scanner.Text()
		fmt.Fprintf(&result, "%d ", countVowel(s))
	}
	fmt.Printf(result.String())
}
