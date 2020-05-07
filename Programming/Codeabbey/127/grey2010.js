//Author grey2010
function dictionarySort(arr){//sorted dictionary by words length, return multidimensional array
  let result = [];
  for(let i=0;i<arr.length;i++){
    if(!(result[arr[i].length]))result[arr[i].length] = [];
    result[arr[i].length].push(arr[i]);
  }
  return result;
}

function findAnagramm(str, wordArr){//sort symbols in strings and compare
  let anagramCounter = 0, existInDict = 0;
  if (wordArr.indexOf(str)+1) {existInDict = 1;}
    str = str.split('').sort().join('');
  for (let i=0;i<wordArr.length;i++){
    if(str===(wordArr[i].split('').sort().join(''))) {anagramCounter++;}
  }
  return anagramCounter-existInDict;
}

function anagtams(arr,dictionary){//arguments:search words, sorted dictionary
let resultArr = [];

for(let i=0;i<arr.length;i++){
resultArr.push(findAnagramm(arr[i],dictionary[arr[i].length]));
}
return resultArr.join(' ');
}
