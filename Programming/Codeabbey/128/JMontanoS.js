//Author JMontanoS
let length = parseInt(input(" "));
let cache = [1];

function factorial(n) {
  if(!cache[n])
    cache[n] = n * factorial(n-1);
  return  cache[n];
}

function combCount(arr) {
  let n = arr[0];
  let k = arr[1];

  return factorial(n)/(factorial(k)*factorial(n-k));
}

for(let i = 0; i<length;i++) {
  output( Math.round(combCount( input().split(" ").map((n) => parseInt(n) ) ) ) + " " );
}
