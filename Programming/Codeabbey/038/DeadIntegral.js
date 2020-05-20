//Author DeadIntegral
// var s = `16
// 9 -36 -405
// 4 -40 96
// 8 -64 96
// 2 -18 40
// 7 -126 910
// 5 50 45
// 9 -54 405
// 5 40 205
// 2 6 0
// 2 16 34
// 8 -136 560
// 6 -6 -72
// 7 -35 -350
// 4 24 100
// 7 -140 728
// 2 -4 20`.split(`
// `);
var s = input().split(`
`);

var result = [];
for(var i = 1; i <= s[0]; i++){
  result.push(calc(s[i]));
}

function calc(arg){
  var list = arg.split(' ');
  var a = list[0];
  var b = list[1];
  var c = list[2];
  var iNumChk = 0;
  var root = (b*b) - (4*a*c);
  var result = [];
  var x1 = 0, x2 = 0;
  if(root < 0){
    iNumChk = 1;
    root *= -1;
    x1 = (-b / (2*a))+'+'+Math.sqrt(root) / (2 * a) + 'i';
    x2 = (-b / (2*a))+''+-Math.sqrt(root) / (2 * a) + 'i';
  }else{
    x1 = (-b + Math.sqrt(root)) / (2 * a);
    x2 = (-b - Math.sqrt(root)) / (2 * a);
  }
  return x1+' '+x2;
}

result = result.join('; ');
// console.log(result);
output(result)