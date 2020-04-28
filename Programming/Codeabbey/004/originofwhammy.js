//Author originofwhammy
var n = input();

for (i = 0; i < n; i++) {
    let temp = input().split(' ');
    if (parseInt(temp[0]) < parseInt(temp[1])) {
        output(temp[0] + " ");
    } else {
        output(temp[1] + " ");
    }

}
