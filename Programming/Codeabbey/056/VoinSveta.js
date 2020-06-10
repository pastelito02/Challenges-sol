//Author VoinSveta
let input = prompt().split(" ");
let areal = [];
let newCoord = [];
let dieCoord = [];
let tarr;
for (let i = 0; i < 15; i++) {
    tarr = [];
    for (let j = 0; j < 17; j++) {
        tarr.push("-");
    }
    areal.push(tarr);
}
for (let i = 0; i < input.length; i++) {
    for (let j = 0; j < input[i].length; j++) {
        areal[i + 5][j + 5] = input[i][j];
    }
}
let count = 0;
let numOfNeighbors;
let out = "";
for (let z = 0; z < 5; z++) {
    for (let i = 0; i < areal.length; i++) {
        for (let j = 0; j < areal[i].length; j++) {
            numOfNeighbors = 0;
            if (areal[i][j] === "X") {
                count++;
            }
            if ((i - 1 >= 0) && (j - 1 >= 0) && (areal[i - 1][j - 1] === "X")) {
                numOfNeighbors++;
            }
            if ((i - 1 >= 0) && (areal[i - 1][j] === "X")) {
                numOfNeighbors++;
            }
            if ((i - 1 >= 0) && (j + 1 < areal[i].length) && (areal[i - 1][j + 1]) === "X") {
                numOfNeighbors++;
            }
            if ((j - 1 >= 0) && (areal[i][j - 1] === "X")) {
                numOfNeighbors++;
            }
            if ((j + 1 < areal[i].length) && (areal[i][j +1] === "X")) {
                numOfNeighbors++;
            }
            if ((i + 1 < areal.length) && (j - 1 >= 0) && (areal[i + 1][j - 1] === "X")) {
                numOfNeighbors++;
            }
            if ((i + 1 < areal.length) && (areal[i + 1][j] === "X")) {
                numOfNeighbors++;
            }
            if ((i + 1 < areal.length) && (j + 1 < areal[i].length) && (areal[i + 1][j + 1] === "X")) {
                numOfNeighbors++;
            }
            if ((numOfNeighbors < 2) || (numOfNeighbors > 3)) {
                dieCoord.push([i, j]);
            } else if (numOfNeighbors === 3) {
                newCoord.push([i, j]);
            }
        }
    }
    for (let i = 0; i < dieCoord.length; i++) {
        if (areal[dieCoord[i][0]][dieCoord[i][1]] === "X") {
            count--;
        }
        areal[dieCoord[i][0]][dieCoord[i][1]] = "-";
    }
    for (let i = 0; i < newCoord.length; i++) {
        if (areal[newCoord[i][0]][newCoord[i][1]] === "-") {
            count++;
        }
        areal[newCoord[i][0]][newCoord[i][1]] = "X";
    }
    dieCoord.length = 0;
    newCoord.length = 0;    
    out += count + " ";
    count = 0;
}
console.log(out.trim());