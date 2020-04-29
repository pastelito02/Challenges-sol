//Author dmitriygo
package main

import (
	"bufio"
	"fmt"
	"os"
)

// Vowel Count
// http://www.codeabbey.com/index/task_view/vowel-count

func vowels_count(text string) int {

	vowels := "aouiey"
	count := 0
	for _, word := range text {
		for _, vowel := range vowels {
			if word == vowel {
				count++
			}
		}
	}
	return count
}

func main() {

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {

		text := scanner.Text()

		fmt.Printf("%d ", vowels_count(text))

	}

}
