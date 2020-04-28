//Author neilxdsouza
var n = parseInt(input(), 10);

var i =0;
for (; i< n; ++i) {
    var arr2nos = input().split(' ');
    var term1 = parseInt(arr2nos[0]);
    var term2 = parseInt(arr2nos[1]);
    if (term1 < term2) {
        output(term1);
    } else {
        output(term2);
    }
    output(' ');
}
