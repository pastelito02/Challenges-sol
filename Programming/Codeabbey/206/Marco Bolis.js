//Author Marco Bolis
const zeropad = (n, s) => Array.range(0, n-s.length).fill(0).join("") + s;
const pbits = n => x => zeropad(n, x.toString(2));
const pbitss = (n, xs) => xs.map(pbits(n)).join("");

const convert = (input, insize, outsize) => {
    console.log(pbitss(insize, input));

    const pushWidth = 32 - insize, shiftWidth = 32 - outsize;
    const output = [];
    let bits = 0x0, length = 0;
    while (input.length * insize + length) {
        while (length < outsize) {
            const i = input.shift();
            bits |= i << pushWidth-length;
            length += insize;
        }

        output.push(bits >>> shiftWidth);
        bits <<= outsize;
        length -= outsize;
    }

    console.log(pbitss(outsize, output));

    return output;
};

const Base32 = {};
Base32.SYMBOLS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"
Base32.encode = text => {
    const paddingLength = (5 - text.length % 5);// % 5;
    const padding = Array.range(0, paddingLength).fill(paddingLength).join("");
    const bytes = Array.from(text + padding, ch => ch.charCodeAt(0));
    const quintets = convert(bytes, 8, 5);
    return quintets.map(q => Base32.SYMBOLS[q]).join("");
};
Base32.decode = b32 => {
    const quintets = Array.from(b32, ch => Base32.SYMBOLS.indexOf(ch));
    const bytes = convert(quintets, 5, 8);
    const chars = bytes.map(b => String.fromCharCode(b));

    const padding = +chars[chars.length-1];
    if (padding == padding) {
        chars.splice(-padding, padding);
    }

    return chars.join("");
};

const strings = Array.range(0, input()).map(input);
output(strings.map((string, i) => (i&1 ? Base32.decode : Base32.encode)(string)).join(" "));
