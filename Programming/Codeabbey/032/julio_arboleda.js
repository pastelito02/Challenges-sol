//Author julio_arboleda
/*
$ eslint jarboleda.js
$
*/

function newArray(initial, final, currentArray) {
  if (initial > final) {
    return currentArray.concat([]);
  }
  const concated = currentArray.concat([ initial ]);
  return newArray(initial + 1, final, concated);
}

function removeFromArray(currentArray, countingStep) {
  const theOneToRemove = (countingStep - 1) % currentArray.length;
  const arrayPre = currentArray.slice(0, theOneToRemove);
  const arrayPost = currentArray.slice(theOneToRemove + 1, currentArray.length);
  return arrayPost.concat(arrayPre);
}

function solve(currentArray, countingStep) {
  if (currentArray.length === 1) {
    return currentArray;
  }
  const newArraySolve = removeFromArray(currentArray, countingStep);
  return solve(newArraySolve, countingStep);
}

function solver(mistake, contents) {
  if (mistake) {
    return mistake;
  }
  const inputFile = contents.split(' ');
  const impliedArray = newArray(1, inputFile[0], []);
  const answer = solve(impliedArray, inputFile[1]);
  const output = process.stdout.write(`${ answer }\n`);
  return output;
}

const fileReader = require('fs');

function fileLoad() {
  return fileReader.readFile('DATA.lst', 'utf8', (mistake, contents) =>
    solver(mistake, contents)
  );
}

/* eslint-disable fp/no-unused-expression*/
fileLoad();

/**
$ node jarboleda.js
output:
54
*/