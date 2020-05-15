//Author VoinSveta
let odd = "bcdfghjklmnprstvwxz".split("");
let ad = "aeiou".split("");
let x0 = +prompt();
let newWord = generateWord(6, x0, odd, ad);
let words = [];

for (let i = 0; i < 900000; i++) {
    words.push(newWord());
}

words.sort();

let frWord = words[0];
let count = 0;
let maxCount = 0;

for (let i = 1; i < words.length; i++) {
    if (words[i] === words[i - 1]) {
        count++;
    } else if (count > maxCount) {
        maxCount = count;
        frWord = words[i - 1];
        count = 0;
    } else {
        count = 0;
    }
}

console.log(frWord);

function generateWord(length, x0, oddArray, adArray) {
    
    let oddLength =odd.length;
    let adLength = ad.length;
    
    return function() {
        let res = "";
    
        for (let i = 0; i < length; i++) {
            
            x0 = lcg(x0);
        
            if (i % 2 === 0) {
                res += odd[x0 % oddLength];
            } else {
                res += ad[x0 % adLength];
            }
        }
        return res;
    }
}

function lcg(x0, a = 445, c = 700001, m = 2097152, n = 1) {
    
    for (let i = 0; i < n; i++) {        
        x0 = (a * x0 + c) % m;
    }    
    return x0;
}