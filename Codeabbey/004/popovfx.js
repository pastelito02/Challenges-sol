//Author popovfx
var lines = Number(input());
var answer = '';
for (var i = 0; i < lines; i++) {
    var lineData = input().split(' ');
    var n1 = Number(lineData[0]);
    var n2 = Number(lineData[1]);
    answer += Math.min(n1, n2).toString() + ' ';
}
answer.trim();
output(answer);
