//Author Tehel
const CHARSET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
function encode(line) {
    // pad
    const miss = 5 - line.length % 5;
    line += miss.toString().repeat(miss);
    let out = '';
    for (let i=0; i<line.length/5; i++) {
        let binstr = '';
        for (let j=0; j<5; j++) {
            const bin = line.charCodeAt(i*5+j).toString(2);
            binstr += '0'.repeat((8 - bin.length % 8) % 8) + bin;
        }
        for (let j=0; j<8; j++)
            out += CHARSET[parseInt(binstr.substr(j*5, 5),2)];
    }
    return out;
}
function decode(line) {
    let out = '';
    for (let i=0; i<line.length/8; i++) {
        let binstr = '';
        for (let j=0; j<8; j++) {
            const bin = CHARSET.indexOf(line[i*8+j]).toString(2);
            binstr += '0'.repeat((5 - bin.length % 5) % 5) + bin;
        }
        for (let j=0; j<5; j++)
            out += String.fromCharCode(parseInt(binstr.substr(j*8, 8), 2));
    }
    // unpad
    const lastChar = out[out.length-1];
    out = out.substr(0, out.length - lastChar);
    return out;
}

const n = +input();
const results = [];
for (let i=0; i<n; i++) {
    const line = input();
    results.push((i%2 ? decode : encode)(line));
}
output(results.join(' '));
