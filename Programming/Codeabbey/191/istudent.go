//Author istudent
func spaceshipWeightFraud() {
    var numOfInputs int
    fmt.Scanf("%d\n", &numOfInputs)
    for j := 0; j < numOfInputs; j++ {
        var weight string
        // weight = "27D687F467E376838BA0"
        fmt.Scanf("%s\n", &weight)
        pmin, cmin, cmax := "F", "F", "0"
        var iPmin, iCmin, iCmax int
        var first string
        for i := range weight {
            el := weight[i : i+1]
            if i == 0 {
                first = el
                continue
            }
            if el <= cmin {
                if el == "0" {
                    if i == 1 {
                        continue
                    } else {
                        pmin, iPmin = el, i
                    }
                } else if pmin == "0" {
                    cmin, iCmin = el, i
                } else {
                    pmin, cmin = cmin, el
                    iPmin, iCmin = iCmin, i
                }
            }
            if el >= cmax {
                cmax, iCmax = el, i
            }
        }

        var smallest, biggest string
        if cmin == first || cmin > first {
            if pmin == "0" {
                for i := range weight {
                    el := weight[i : i+1]
                    if i != 0 && el != "0" {
                        smallest = weight[:i] + pmin + weight[i+1:iPmin] + el + weight[iPmin+1:]
                        break
                    }
                }
            } else {
                for i := range weight {
                    el := weight[i : i+1]
                    if i != 0 && el > cmin {
                        smallest = weight[:i] + cmin + weight[i+1:iCmin] + el + weight[iCmin+1:]
                        break
                    }
                }
            }
        } else {
            smallest = cmin + weight[1:iCmin] + weight[0:1] + weight[iCmin+1:]
        }
        if cmax == first || first > cmax {
            for i := range weight {
                el := weight[i : i+1]
                if i != 0 && el < cmax {
                    biggest = weight[:i] + cmax + weight[i+1:iCmax] + el + weight[iCmax+1:]
                    break
                }
            }
        } else {
            biggest = cmax + weight[1:iCmax] + weight[0:1] + weight[iCmax+1:]
        }
        fmt.Printf("%s %s ", smallest, biggest)
    }
}