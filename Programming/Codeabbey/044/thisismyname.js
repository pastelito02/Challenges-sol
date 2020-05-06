//Author thisismyname
var mc = parseInt(input());
var outstr = '';
for(var i = 0; i < mc; i++) {
  var t = input().split(' ');
   t[0] = parseInt(t[0]);
   t[1] = parseInt(t[1]);

  outstr += ((t[0]%6 +1) + (t[1]%6 +1))+' ';
}
output(outstr);
