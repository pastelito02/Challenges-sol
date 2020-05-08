//Author vodmin
package main

import (
	"fmt"
	"strings"
)

func main() {
	var count, answ int
	var guess string
	result := make(map[int]string)
	input := make(map[string]int)
	// scan unput data and store it to the map "input"
	for fmt.Scan(&count); count > 0; count-- {
		fmt.Scanf("%s %d\n", &guess, &answ)
		input[guess] = answ
	}
	// prepare positions map to calculate probabilities
	posMap := make([]map[string]int, 4)
	for i, _ := range posMap {
		posMap[i] = map[string]int{"0": 0, "1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0}
	}
	// tmp variable to store best guess for each attempt
	type tmptype struct {
		pos   int
		prob  int
		digit string
	}
	// do 4 attempts (equaly to number lenght)
	for j := 0; j < 4; j++ {
		for guess, answ = range input {
			letters := strings.Split(guess, "")
			prob := answ
			// if the digit in current position has been found
			// decrease the probability for onterss
			// based on previously gathered information (in result)
			for position, digit := range result {
				if letters[position] == digit {
					prob--
				}
			}

			for i, _ := range posMap {
				letter := letters[i]
				if _, ok := result[i]; ok { // skip the position if the digit is found in result
					continue
				}
				if prob > 0 {
					posMap[i][letter] += prob // probably may be
				} else {
					posMap[i][letter] -= 100 // there never will be such digit in such position
				}
			}
		}
		tmp := tmptype{pos: 0, prob: -100000, digit: ""}
		// need to find the best guess for currently empty positions
		for pos, M := range posMap {
			if _, ok := result[pos]; ok {
				continue
			}
			for digit, prob := range M {
				if prob > tmp.prob {
					tmp.prob = prob
					tmp.pos = pos
					tmp.digit = digit
				}
			}
		}
		result[tmp.pos] = tmp.digit // store the most guess to the result
	}

	for i := 0; i < len(result); i++ {
		fmt.Printf("%s", result[i])
	}
	fmt.Println()
}
