//Author VoinSveta
let input = prompt().split(/\s/).map(Number);
let numTests = input.shift();
let result = [];

for (let i = 0; i < numTests * 2; i += 2) {

  let pA = input[i];
  let pB = input[i + 1];
  let count = 0;

  for (let j = 0; j < 1000000; j++) {

    let f = true;

    while (f) {

      let shoot = getRandom(1, 100);

      if (shoot <= pA) {
        count++;
        f = false;
      }
      shoot = getRandom(1, 100);

      if (shoot <= pB) {
        f = false;
      }
    }
  }
  result.push(Math.round(count / 10000));
}

console.log(result.join(" "));

function getRandom(min, max) {
  return Math.round(min - 0.5 + Math.random() * (max - min + 1));
}
