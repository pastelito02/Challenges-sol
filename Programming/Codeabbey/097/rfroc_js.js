//Author rfroc_js
let numTests = parseInt(input());
//numTests = 2;

let numLegsWoman = 2, numLegsPig = 4;
let numBreastsWoman = 2, numBreastsPig;
let solutions = [];

while(numTests--){

  let testData = input().split(' ').map(Number);
  let numLegs = testData[0];
  let numBreasts = testData[1];

  let maxNumWomen = Math.floor(numLegs /numLegsWoman);
  let maxNumPigs = Math.floor(numLegs /numLegsPig);
  for (let i = 1; i <= maxNumWomen; i++){
    for (let j = 1; j <= maxNumPigs; j++){
      if (i * numLegsWoman + j * numLegsPig === numLegs){
        solutions.push(i);
        solutions.push(j);
      }
    }
  }

  let numSolutions = 0;
  let iMax = Math.floor(solutions.length/2);
  for (let i = 0; i < iMax; i++){
    let numWomen = solutions.shift();
    let numPigs  = solutions.shift();
    numBreastsPig = (numBreasts - (numWomen * numBreastsWoman))/numPigs;
    if (Number.isInteger(numBreastsPig) && (numBreastsPig % 2 === 0)){
      //output(' !!! ' + numWomen + ' women + ' + numPigs + ' pigs with ' + numBreastsPig + ' bs/p = ' + numBreasts + ' breasts ');
      numSolutions++;
    }
  }
  output(numSolutions + ' ');
  solutions = [];

}
