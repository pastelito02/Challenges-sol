//Author GeorgySerga
let inputLength = +input()

let allNumbers = []
for (let i = 0; i < 10000; i++) {
  allNumbers.push(('0000'.slice(String(i).length) + String(i)).split(''))
}

for (let i = 0; i < inputLength; i++) {
  let [number, isCorrectQty] = input().split(' ')
  let numberByDigits = String(number).split('')

  allNumbers = allNumbers.filter(n => {
    let numbersInPlace = 0
    for (let j = 0; j < numberByDigits.length; j++) {
      if (n[j] === numberByDigits[j]) {
        numbersInPlace++
      }
    }
    return numbersInPlace === Number(isCorrectQty)
  })
}

output(allNumbers[0].join(''))
