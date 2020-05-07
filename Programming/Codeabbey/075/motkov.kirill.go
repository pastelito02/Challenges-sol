//Author motkov.kirill
package main

import "fmt"

func main() {
	var arr [5]int
	var arrFas [6]int
	var testcount int
	var flagThree, flagTwo, contFlag bool
	fmt.Scanf("%d\n", &testcount)
	for h := 0; h < testcount; h++ {
		flagThree, flagTwo, contFlag = false, false, false
		arrFas = [6]int{0, 0, 0, 0, 0, 0}
		for i := 0; i < 5; i++ {
			fmt.Scanf("%d", &arr[i])
		}
		for i := 1; i <= 6; i++ {
			for j := 0; j < 5; j++ {
				if arr[j] == i {
					arrFas[i-1]++
				}
			}
		}
		if arrFas == [6]int{1, 1, 1, 1, 1, 0} {
			//+sequence from 1 to 5, like 2 4 3 5 1 - called small-straight;
			fmt.Printf("small-straight ")
			continue
		} else if arrFas == [6]int{0, 1, 1, 1, 1, 1} {
			//+sequence from 2 to 6, like 6 3 4 2 5 - called big-straight.
			fmt.Printf("big-straight ")
			continue
		}
		for i := 0; i < 6; i++ {
			if arrFas[i] == 5 {
				//all five dice have the same points, like 2 2 2 2 2 - called yacht;
				fmt.Printf("yacht ")
				contFlag = true
				break
			} else if arrFas[i] == 4 {
				//four of dice have the same points, like 1 4 1 1 1 - called four;
				fmt.Printf("four ")
				contFlag = true
				break
			} else if arrFas[i] == 3 {
				flagThree = true
			} else if arrFas[i] == 2 && flagTwo {
				//two pairs at once, like 3 6 5 3 5 - called two-pairs;
				fmt.Printf("two-pairs ")
				contFlag = true
				break
			} else if arrFas[i] == 2 {
				flagTwo = true
			}
		}
		if contFlag {
			continue
		} else if flagThree && flagTwo {
			//pair and three at once, like 1 6 6 1 6 - called full-house;
			fmt.Printf("full-house ")
			continue
		} else if flagThree {
			//three of dice have the same points, like 2 4 5 4 4 - called three;
			fmt.Printf("three ")
			continue
		} else if flagTwo {
			//two of dice have the same points, like 3 6 5 6 1 - called pair;
			fmt.Printf("pair ")
			continue
		} else {
			fmt.Printf("none ")
			continue
		}
	}
}
