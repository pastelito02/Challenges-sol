//Author dimireme
const n = input();
const result = [];
const a = input();
let b = input();
for(let i=0; i<n-2; i++) {
  let c = input();
  result.push(area(a, b, c));
  b = c;
}

output(result.reduce((sum, i) => (sum + i)));

function area(a, b, c) {
  const [x1, y1] = a.split(' ');
  const [x2, y2] = b.split(' ');
  const [x3, y3] = c.split(' ');
  const p = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2);
  return Math.abs(p) / 2;
}
