//Author andanari.p
var a = new Array(1.5E6).fill().map(function(n, m) {return m + 1});
for(var i = 1; i < 1230; i++){
    for(var j = i; j <= 1E6; j++) {
        var b = i + j + 2*i*j;
        if(b >= 3E6) {
            break;
        } else {
            a[b-1] = 0;
        }
    }
}
a = a.filter(function(n) {return !(n == 0)}).map(function(m) {return 2*m + 1});
var b = parseInt(input());
for(var i = 0; i < b; i++) {
    var c = input().split(" ").map(function(n) {return parseInt(n)});
    var d = 0;
    for(var j = 78500; j < 216815; j++) {
        if(a[j] >= c[0] && a[j] <= c[1]) {
            d++;
        } else if(a[j] > c[1]) {
            break;
        }
    }
    output(d + " ");
}