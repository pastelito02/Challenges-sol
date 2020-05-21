//Author Vladislav Kondratov
const rounds = +input();

for (let i = 0; i < rounds; i++) {
    const weight = [...input()];
    output(`${findSmallestWeight([].concat(weight))} ${findBiggestWeight([].concat(weight))} `)
}


function findSmallestWeight(weight) {
   const numbers = weight.map(item => parseInt(item, 16));
   for(let i = 0; i < numbers.length; i++) {
        let seacherNumbers = numbers.slice(i),
            smallestNumber = Math.min.apply(null, seacherNumbers);

        if (numbers[i] != smallestNumber) {
            if (smallestNumber == 0 && i == 0) {
                smallestNumber = Math.min.apply(null, [].concat(numbers).filter(x => x > 0));
                if (smallestNumber < numbers[i]) {
                    let smallestNumberPosition = numbers.lastIndexOf(smallestNumber);
                    [numbers[i], numbers[smallestNumberPosition]] = [numbers[smallestNumberPosition], numbers[i]];
                    return (numbers.map(item => item.toString(16).toUpperCase()).join(""));
                } else {
                    continue;   
                }
            }
            let smallestNumberPosition = numbers.lastIndexOf(smallestNumber);
            [numbers[i], numbers[smallestNumberPosition]] = [numbers[smallestNumberPosition], numbers[i]];
            return (numbers.map(item => item.toString(16).toUpperCase()).join(""));
        }
    }
    return(numbers.map(item => item.toString(16).toUpperCase()).join(""));
}

function findBiggestWeight(weight) {
    const numbers = weight.map(item => parseInt(item, 16));
    for(let i = 0; i < numbers.length; i++) {
        let seacherNumbers = numbers.slice(i),
            biggestNumber = Math.max.apply(null, seacherNumbers);
        
        if (numbers[i] != biggestNumber) {
            let biggestNumberPosition = numbers.lastIndexOf(biggestNumber);
            [numbers[i], numbers[biggestNumberPosition]] = [numbers[biggestNumberPosition], numbers[i]];
            return(numbers.map(item => item.toString(16).toUpperCase()).join(""));
        }
    }
    return(numbers.map(item => item.toString(16).toUpperCase()).join(""))
}