//Author sevarozhkov
var n = input();
var x = input().split(' ');
for(let i=0; i<n; i++){
  var fibs = [0, 1];
  while (true) {
    var f = fibs[fibs.length - 1] + fibs[fibs.length - 2];
    fibs.push(f % x[i]);
    if(fibs[fibs.length-1]==0){
      output(fibs.length-1+' ');
      break;
    }
  }
}
