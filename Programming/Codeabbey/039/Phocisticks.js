//Author Phocisticks
const testCases = parseInt(input());

const calcAvg = array => array.reduce((acc, c) => acc + c) / array.length;

// const calcStD = array => {
//     const mean = calcAvg(array);

//     const distances = array.map(ele => Math.pow(ele - mean, 2));

//     return Math.sqrt(calcAvg(distances));
// }

const calcStD = array =>
  Math.sqrt(calcAvg(array.map(ele => Math.pow(ele - calcAvg(array), 2))));

const calcCommish = array =>
  calcAvg(array) / 100.0;

const answer = Array(testCases).fill().map(tCase => {
  let [name, ...prices] = input().split(' ');
  prices = prices.map(p => parseInt(p));

  return calcStD(prices) / calcCommish(prices) >= 4 ? name : null;


}).filter(ele => ele != null).join(' ');

output(answer);
