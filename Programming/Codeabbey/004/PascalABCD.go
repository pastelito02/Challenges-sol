//Author PascalABCD
package main;

import (
    "fmt",
    "strconv",
    "strings"
)

const input = `20
-462897 -5248528
5110639 -5841862
67229 -3528595
-7683505 3931639
-2330882 -2922807
-3288928 5328363
-2142077 1549781
-9848930 5150891
-7979670 -7654370
7900096 -9363416
2249663 -2589237
8988844 3962658
5967007 -6368799
1845025 -5854771
1675220 6825470
-4938560 -8787677
-8423058 -9827921
-4629539 1644171
-3356516 -2313045
-4424190 4312602`

func main() {
    lines := strings.Split(input, "\n")

    var result []string

    for i := 1; i < len(lines); i++ {
        nums := strings.Split(lines[i], " ")

        a, _ := strconv.Atoi(nums[0])
        b, _ := strconv.Atoi(nums[1])

        if a < b {
            result = append(result, strconv.Itoa(a))
        } else {
            result = append(result, strconv.Itoa(b))
        }

    }

    fmt.Println(strings.Join(result, " "))
}
