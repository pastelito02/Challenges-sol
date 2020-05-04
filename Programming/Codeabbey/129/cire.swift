//Author cire
let input = """
19
23 7 133437
26 10 4368800
8 7 6
33 15 813398113
16 7 7682
27 19 1541295
30 15 108536380
34 15 1284481180
32 14 306699570
28 13 25504935
13 9 429
14 12 70
35 14 1545738788
36 15 3628930784
35 14 1810223698
33 15 534060817
14 4 818
22 2 130
25 23 228
"""

let lines = input.split(separator: "\n")
let cases = lines[1...].map({ $0.split(separator: " ").map({ Int($0)! }) })

let alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let start = alphabet.startIndex

func choose(_ n: Int, _ k: Int) -> Int {
  if k == 0 {
    return 1
  }
  return n * choose(n - 1, k - 1) / k
}

func iters(n: Int, k: Int) -> Int {
  let p = n - k + 1
  return (p + 1) * p / 2
}

var answer = ""
for c in cases {
  let (N, K, I) = (c[0], c[1], c[2])
  let end = alphabet.index(start, offsetBy: N)

  var (n, k, left) = (N - 1, K - 1, I)
  var idxs = [Int]()
  var i = 0
  while left > 0 {
    let skip = choose(n, k)
    if left - skip < 0 {
      idxs.append(i)
      k -= 1
    } else {
      left -= skip
    }
    n -= 1
    i += 1
  }
  for _ in idxs.count..<K {
    idxs.append(i)
    i += 1
  }

  let alpha = [Character](alphabet[start..<end])
  var combo = [Character]()
  for idx in idxs {
    combo.append(alpha[idx])
  }
  answer += String(combo) + " "
}
print(answer)
