//Author thecippih
// declare
var array = [[3951087, -9455746],[-9062721, -6174231],[874497, 4257956],[-5209629, 1979522],[-5420024, 8806940],[-7318447, -1211819],[2644203, -4185359],[4027001, 1415227],[-3381782, -9025825],[9944778, -275655],[6313527, -6103547],[9499000, 2579542],[-5795762, -6154543],[1628700, -9931810],[5072166, 1135097],[1857131, -8878921],[1679351, 2794409],[-5053153, -7446152],[-2947634, -262782],[4533370, 1632341],[-1455841, 7214923],[-9579477, -8811638],[-6970435, 4447523],[2603589, -352218],[5421697, 2548367],[9372126, 1735225]];
var newArray = [];

// function to find lowest number from array
function findLowest(numArray) {
    for(var i = 0; i < numArray.length; i++) {
        // compare the two values in the array and find the lowest
        // does NOT work with more than two values at a time
(numArray[i][0] < numArray[i][1]) ? newArray.push(numArray[i][0]) : newArray.push(numArray[i][1]);
    }
}

findLowest(array);
console.log(newArray);
