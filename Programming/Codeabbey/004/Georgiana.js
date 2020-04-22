//Author Georgiana
// First line
var firstLine = input().split(' ').map(Number);

// Get all lines and return as a nested array
var getInput = function (n) {
    var lines = [];

    // Array for each number in one line
    for (var i = 0; i < n; i++) {
        lines[i] = input().split(' ').map(Number);
    }

    // All lines
    return lines;
};

// Loop through array and get minimum number, return as new array
var minNum = function () {
    var lines = getInput(firstLine);
    var result = [];

    for (line in lines) {
        result[line] = Math.min.apply(null, lines[line]);
    }

    return result.join(' ');

};


// Return result
output(minNum());
