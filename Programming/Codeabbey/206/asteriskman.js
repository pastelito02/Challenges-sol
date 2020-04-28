//Author asteriskman
const n = input()|0;

const codeChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
const resultList = [];
for (let i = 0; i < n; i++) {
    if (i % 2 === 0) {
        const line = input();
        const padCount = 5 - (line.length % 5);
        const padded = line.padEnd(line.length + padCount, padCount.toString());
        const ascii = padded.split``.map( v => v.charCodeAt(0));
        const binary = ascii.reduce( (acc, e) => {return acc + e.toString(2).padStart(8, '0');}, '');
        let result = '';
        for (let start = 0; start < binary.length; start += 5) {
            const bstring = binary.substr(start, 5);
            const codeVal = parseInt(bstring, 2);
            const newChar = codeChars[codeVal];
            result += newChar;
        }
        resultList.push(result);
    } else {
        const line = input();
        console.log(line);
        const codeVals = line.split``.map( v => codeChars.indexOf(v));
        console.log(codeVals);
        const bstring = codeVals.reduce( (acc, e) => {return acc + e.toString(2).padStart(5, '0')}, '');
        console.log(bstring);
        let result = '';
        for (let start = 0; start < bstring.length; start += 8) {
            const bpiece = bstring.substr(start, 8);
            result += String.fromCharCode(parseInt(bpiece, 2));
        }
        const trimCount = parseInt(result[result.length - 1]);
        result = result.substr(0, result.length - trimCount);
        resultList.push(result);
    }
}

output(resultList.join` `);
