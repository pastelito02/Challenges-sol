//Author simpfally
package main

import (
  "bufio"
  "fmt"
  "log"
  "math"
  "os"
  "strconv"
  "strings"
)

func digiCount(n int) int {
  var i int

  for i = 0; n > 0; i++ {
    n /= 10
  }

  return i
}

func Decompose(n int) []int {
  dig := digiCount(n)
  b := make([]int, dig)

  dig -= 1

  for i := dig; i >= 0; i-- {
    b[dig-i] = (n / int(math.Pow(10, float64(i)))) % 10
  }
  return b
}

func Sum(a []int) int {
  var s int
  for _, v := range a {
    s += v
  }
  return s
}

func WSD(digits []int) (sum int) {
  for i, d := range digits {
    sum += d * (i + 1)
  }
  return sum
}

func Ave(a []int) float64 {
  s, l := 0, len(a)
  for _, v := range a {
    s += v
  }
  return float64(s) / float64(l)
}

func rnd(f float64) int {
  return int(f + 0.5)
}

func Check(a []int, m, l int) int {
  s := 0
  for _, v := range a {
    s = ((v + s) * m) % l
  }
  return s
}

func OccurNum(a []int) []int {
  b := make([]int, 20)
  for _, v := range a {
    b[v-1]++
  }
  return b
}

func fn(a []int) []int {
  return OccurNum(a)
}

func main() {
  in := bufio.NewReader(os.Stdin)
  var a []int
  for {
    li, err := in.ReadString('\n')
    if err != nil {
      log.Fatalln("Err:", err)
    }
    if len(li) < 2 {
      break
    }
    li = strings.TrimSuffix(li, "\n")
    s := strings.Split(li, " ")

    nu := make([]int, 0, len(s))

    for i, n := range s {
      fl, err := strconv.ParseFloat(n, 64)
      if err != nil {
        fmt.Printf("%d: %s isn't a valid number\n", i+1, n)
        continue
      }

      nu = append(nu, int(fl))
    }
    a = fn(nu) //append(a, fn(nu))
    //fmt.Println(fn(nu...))
    //fmt.Printf("%d\n", fn(nu...))
  }
  fmt.Println(a)
}