//Author istudent
func rotationIn2dSpace() {
    type positionOfStar struct {
        Name string
        X    float64
        Y    float64
    }

    var numOfInputs int
    var angle float64
    fmt.Scanf("%d %f\n", &numOfInputs, &angle)
    angle = angle * (math.Pi / 180)
    stars := []positionOfStar{}
    for i := 0; i < numOfInputs; i++ {
        var name string
        var x, y float64
        fmt.Scanf("%s %f %f\n", &name, &x, &y)
        stars = append(stars, positionOfStar{
            Name: name,
            X:    x*math.Cos(angle) - y*math.Sin(angle),
            Y:    x*math.Sin(angle) + y*math.Cos(angle),
        })
    }
    sort.Slice(stars, func(i, j int) bool {
        if stars[i].Y == stars[j].Y {
            return stars[i].X < stars[j].X
        }
        return stars[i].Y < stars[j].Y
    })
    for _, star := range stars {
        fmt.Printf("%s ", star.Name)
    }
}