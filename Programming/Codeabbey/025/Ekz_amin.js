//Author Ekz_amin
console.clear();
var count = Number(input());
var resultArr = [];
for (var i = 0; i < count; i++){
    var lineArr = input().split(' ');
    var A = Number(lineArr[0]);
    var C = Number(lineArr[1]);
    var M = Number(lineArr[2]);
    var X = Number(lineArr[3]);
    var N = Number(lineArr[4]);
    var Numb = RandomNumbers(A, C, M, X, N);
    resultArr.push(Numb);
}
var resultStr = resultArr.join(' ');
//console.log (resultStr);
output(resultStr);
    
function RandomNumbers(A, C, M, X, N) {
    for(var k = 1; k <= N; k++) {
        X = (A * X + C) % M;
    }
    //console.log(Xnext);
    return X;
}