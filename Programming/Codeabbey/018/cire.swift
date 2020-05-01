//Author cire
let input = """
12
3334 6
902 3
68264 9
378 4
63233 13
66710 6
5802 6
5990 11
936 1
892 7
63 11
9466 10
"""

let lines = input.split(separator: "\n")

let formatter = NumberFormatter()
formatter.usesSignificantDigits = true
formatter.minimumSignificantDigits = 1
formatter.maximumSignificantDigits = 12

var answer = ""
for line in lines[1...] {
  let ints = line.split(separator: " ").map({ Int($0)! })
  let (x, n) = (Double(ints[0]), ints[1])
  var r: Double = 1.0
  for _ in 0..<n {
    r = (r + x / r) / 2
  }
  let val = formatter.string(from: NSNumber(floatLiteral: r))!
  answer += val + " "
}
print(answer.trimmingCharacters(in: .whitespaces))
