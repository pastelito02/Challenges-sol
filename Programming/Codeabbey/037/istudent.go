//Author istudent
func mortgageCalculator() {
    var p, r, l float64
    fmt.Scanf("%f %f %f\n", &p, &r, &l)
    r = r / 100 / 12
    var rMul float64
    for i := 0.0; i < l; i++ {
        rMul = rMul + math.Pow(1+r, i)
    }
    m := p * math.Pow((1+r), l) / rMul
    fmt.Println(math.Round(m))
}