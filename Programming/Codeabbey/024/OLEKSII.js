//Author OLEKSII
var n = parseInt(input());
var numbers = input().split(" ");
var result = [];

for (var i = 0; i < n; i++) {
    var intermediateResults = [parseInt(numbers[i])];
    var endOfMaths = false;
    var number = 0;
    var count = 0;
    
    while (endOfMaths === false) {
        console.log(intermediateResults);
        number = parseInt((parseInt(intermediateResults[count]) * parseInt(intermediateResults[count])) / 100) % 10000;
        console.log(number);
        if (intermediateResults.indexOf(number) > -1) {
            result.push(++count);
            endOfMaths = true;
        }
        
        intermediateResults.push(number);
        count++;
    }
}

output(result.join(" "));
