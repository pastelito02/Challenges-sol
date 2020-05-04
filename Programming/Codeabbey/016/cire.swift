//Author cire
let input = """
9
910 759 1090 134 748 0
203 140 166 58 58 38 82 178 230 50 2 45 105 76 68 0
1206 427 1851 858 480 1993 1921 1390 703 963 1523 1451 944 1800 1022 0
1484 469 1377 85 1892 0
477 382 331 116 4 314 369 305 421 320 8 0
3900 3007 3848 1728 1957 0
5837 2398 14554 14460 14266 1919 9084 14946 670 2026 2425 15902 0
1600 7164 3328 7496 3848 1863 4409 3962 2317 1100 3568 138 602 7023 0
6059 6968 7104 5143 6006 6044 6102 2355 5325 6437 0
"""

let lines = input.split(separator: "\n")
var answer = ""
for line in lines[1...] {
  let ints = line.split(separator: " ").map({ Int($0)! })
  let avg = Int((Float(ints.reduce(0, +)) / Float(ints.count - 1)).rounded())
  answer += "\(avg) "
}
print(answer.trimmingCharacters(in: .whitespaces))
