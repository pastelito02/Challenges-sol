//Author Tehel
const n = +input();
const results = [];
for (let i=0; i<n; i++) {
  const [legs, breasts] = input().split(' ').map(n => +n);
  let nb = 0;
  let diff = breasts - legs;
  const divs = []
  for (let p=1; p<=diff; p++) {
    const div = diff/p;
    const n = diff/p+4;
    const g = (legs - 4*p)/2;
    if (Math.floor(div) === div && n>2 && !(n%2) && g>0)
      divs.push(n);
  }
  results.push(divs.length);
}
output(results.join(' '));
