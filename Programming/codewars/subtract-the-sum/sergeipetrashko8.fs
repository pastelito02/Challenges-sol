//sergeipetrashko8
let sumOfDitits num =
    let rec inner sum curr =
        if curr<=0
        then sum
        else inner (curr%10 + sum) (curr/10)
    inner 0 num

let rec subtractSum n =
  match sumOfDitits n - n with
  | 1 | 3 | 26 | 24 | 47 | 49 | 68 | 70 | 91 | 93 -> "kiwi"
  | 2 | 21 | 23 | 42 | 44 | 46 | 65 | 67 | 69 | 88 -> "pear"
  | 4 | 6 | 25 | 29 | 48 | 50 | 71 | 73 | 92 | 94 | 96 -> "banana"
  | 5 | 7 | 28 | 30 | 32 | 51 | 53 | 74 | 76 | 95 | 97 -> "melon"
  | 8 | 10 | 12 | 31 | 33 | 52 | 56 | 75 | 77 | 79 | 98 | 100 -> "pineapple"
  | 9 | 18 | 27 | 36 | 45 | 54 | 63 | 72 | 81 | 90 | 99 -> "apple"
  | 11 | 13 | 34 | 55 | 57 | 59 | 78 | 80 -> "cucumber"
  | 14 | 16 | 35 | 37 | 39 | 58 | 60 | 83 -> "orange"
  | 15 | 19 | 17 | 38 | 40 | 61 | 82 | 84 | 86 -> "grape"
  | 20 | 22 | 41 | 43 | 62 | 64 | 66 | 85 | 87 | 89 -> "cherry"
  | x -> subtractSum x
