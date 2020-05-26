//Author cankayabebesi
var size = input();
for (var i = 0; i < size; i++) {
    var [k, q] = input().split(' ');
    output(kingCrossQueen(k, q) + ' ');
}

function kingCrossQueen(k, q) {
 var [kingcolumn, kingrow] = k.split('');
 var [queencolumn, queenrow] = q.split('');
 
 if (kingcolumn == queencolumn) return 'Y';
 else if(kingrow == queenrow) return 'Y';

else if(Math.abs(kingcolumn.charCodeAt() - queencolumn.charCodeAt()) == Math.abs(kingrow - queenrow)) return 'Y'
 else return 'N'
 
}