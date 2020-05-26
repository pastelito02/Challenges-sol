//Author istudent
func matchingWords() {
    m := map[string]int{}
    var key string
    for {
        fmt.Scanf("%s", &key)
        if key != "end" {
            if m[key] == 0 {
                m[key] = 1
            } else {
                m[key]++
            }
        } else {
            break
        }
    }

    res := []string{"zzz"}
    for k, v := range m {
        if v > 1 {
            for i, el := range res {
                if k < el {
                    rest := append([]string(nil), res[i:]...)
                    res = res[:i]        
                    res = append(res, k) 
                    res = append(res, rest...)
                    break
                }
            }
        }
    }
    res = res[:len(res)-1]
    fmt.Println(res)
}