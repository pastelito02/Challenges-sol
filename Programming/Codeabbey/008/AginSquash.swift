//Author AginSquash
func ParseAndCalc(element: [String.SubSequence]) -> Int
{
  let A = Int(element[0])!
  let B = Int(element[1])!
  let N = Int(element[2])!

  var ans = 0
  for i in 0..<N
  {
    ans += A + (B * i)
  }
  return ans
}


let numTest = Int( readLine()! )!
print()

var testAnswers = String()
for _ in 0..<numTest
{
  let element = readLine()!
  let ans = ParseAndCalc(element: element.split(separator: " "))
  testAnswers += " \(ans)"
}

print( testAnswers.dropFirst() )
