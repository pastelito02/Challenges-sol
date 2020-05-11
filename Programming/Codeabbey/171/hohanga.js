//Author hohanga
var nums = '115 110.063\n\
24 136.169\n\
66 127.147\n\
62 132.089\n\
16 133.152\n\
65 107.103\n\
16 136.736\n\
42 129.806\n\
118 118.098\n\
78 131.082\n\
69 130.050\n\
44 132.979\n\
33 124.875'
.split('\n')
.map(function(r){
  return r.split(' ').map(function(n){
    return +n;
  })
})

var result = nums.map(function(n){
  var a = 90 - n[1];
  return Math.abs(Math.round(n[0]*Math.tan((a* Math.PI)/180)));
})

console.log(result.join(' '));
