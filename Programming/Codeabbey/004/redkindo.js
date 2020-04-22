//Author redkindo
var str=input().split(' ');
var n=parseInt(str[0]);
for(var i=0; i < n; i++){
    var sum=input().split(' ');
    output(Math.min(parseInt(sum[0]),parseInt(sum[1]))+' ');
}
