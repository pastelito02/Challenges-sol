//Author grey2010
function fibonacciDiv(arr){
  let divisor, resultArr = [];
for(let i=0;i<arr.length;i++){
  let fibA=0, fibB=1, fibC, index = 1;
  divisor = +arr[i];
  while(1){
    fibC = fibA+fibB;
    fibA = fibB%divisor, fibB = fibC%divisor;
    index++;
    if (fibC>=divisor){
      if (!(fibC%divisor)){
        resultArr.push(index);
        break;
      }}}
}
return resultArr.join(' ');
}
