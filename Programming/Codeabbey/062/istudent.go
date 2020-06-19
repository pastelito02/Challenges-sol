//Author istudent
func primeRanges() {
    var numOfInputs int
    prime := primeNumbersGenertion()
    fmt.Scanf("%d\n", &numOfInputs)
    for i := 0; i < numOfInputs; i++ {
        var a, b, counter int
        fmt.Scanf("%d %d\n", &a, &b)
        num := a
        for num <= b {
            var flag bool
            for _, el := range prime {
                if float64(el) <= math.Sqrt(float64(num)) {
                    if num%el == 0 {
                        flag = true
                        break
                    }
                } else {
                    break
                }
            }
            if !flag {
                counter++
            }
            num++
        }
        fmt.Printf("%d ", counter)
    }
}