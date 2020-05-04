//Author AginSquash
func wsd(element: Substring) -> Int
{
  //let intFromElement = Int(element)!
  var k = 1
  var weighted_sum = Int()
  for char in element
  {
    weighted_sum += char.wholeNumberValue! * k
    k+=1
  }
  return weighted_sum
}

_ = readLine()

let strEntered = readLine()!.split(separator: " ")
var output = String()
for str in strEntered
{
   output += "\(wsd(element: str)) "
}
print(output.dropLast())
