//Author Rodionische
var limit = 8;

function generateFibonacci(count, limit) {
  var mod = Math.pow(10, limit);
  var fibs = [0, 1];
  while (fibs.length < count) {
    var f = fibs[fibs.length - 1] + fibs[fibs.length - 2];
    fibs.push(f % mod);
  }
  return fibs;
}

function inverseArray(a) {
  var res = [];
  for (var i = 0; i < a.length; i++) {
    res[a[i]] = i;
  }
  return res;
}

function truncatedValue(s, limit) {
  if (s.length > limit) {
    s = s.substring(s.length - limit);
  }
  return parseInt(s);
}

var fibs = inverseArray(generateFibonacci(1000, limit));

var n = parseInt(input());

var res = [];

for (var i = 0; i < n; i++) {
  var f = truncatedValue(input(), limit);
  res.push(fibs[f]);
}

output(res.join(' '));
