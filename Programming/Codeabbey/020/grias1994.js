//Author grias1994
const n = input();
const vowelArr = ['a', 'o', 'u', 'i', 'e', 'y'];
let outputStr = '';

for (var i = 0; i < n; i++) {
  let vowelCount = 0;
  let inpArr = input().split('');

  for (vowel of vowelArr) {
    for (letter of inpArr) {
      if (letter === vowel) vowelCount++;
    }
  }
  outputStr += ' ' + vowelCount;
}

output(outputStr);
