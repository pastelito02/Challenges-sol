//Author Marco Bolis
const Tree = {};
Tree.isLeaf = n => !!n.letter;
Tree.add = (n, [b, ...bits], letter) => {
    if (Tree.isLeaf(n) && (typeof b != "undefined" || letter != n.letter)) {
        throw new Error(`Leaf (${n.letter}) reached. Cannot overwrite with ${letter}.`);
    }

    if (typeof b == "undefined") {
        n.letter = letter;
        return;
    }

    const next = n[b] || (n[b] = {});
    Tree.add(next, bits, letter);
};

const letters = {};
Tree.add(letters, "11", " ");
Tree.add(letters, "1001", "t");
Tree.add(letters, "10000", "n");
Tree.add(letters, "0101", "s");
Tree.add(letters, "01000", "r");
Tree.add(letters, "00101", "d");
Tree.add(letters, "001000", "!");
Tree.add(letters, "000101", "c");
Tree.add(letters, "000011", "m");
Tree.add(letters, "0000100", "g");
Tree.add(letters, "0000010", "b");
Tree.add(letters, "00000001", "v");
Tree.add(letters, "0000000001", "k");
Tree.add(letters, "000000000001", "q");
Tree.add(letters, "101", "e");
Tree.add(letters, "10001", "o");
Tree.add(letters, "011", "a");
Tree.add(letters, "01001", "i");
Tree.add(letters, "0011", "h");
Tree.add(letters, "001001", "l");
Tree.add(letters, "00011", "u");
Tree.add(letters, "000100", "f");
Tree.add(letters, "0000101", "p");
Tree.add(letters, "0000011", "w");
Tree.add(letters, "0000001", "y");
Tree.add(letters, "000000001", "j");
Tree.add(letters, "00000000001", "x");
Tree.add(letters, "000000000000", "z");

const BASE_32 = "0123456789ABCDEFGHIJKLMNOPQRSTUV";
const fromBase32 = ch => BASE_32.indexOf(ch);
const toBits = n => {
    const bits = [];
    for (let i = 4; i >= 0; i--) {
        bits.push((n >> i) & 0x1);
    }
    return bits;
};

const decode = text => {
    const decoded = [];
    let n = letters;
    for (let i = 0; i < text.length; i++) {
        const value = fromBase32(text[i]);
        const bits = toBits(value);
        for (let j = 0; j < bits.length; j++) {
            n = n[bits[j]];
            if (Tree.isLeaf(n)) {
                decoded.push(n.letter);
                n = letters;
            }
        }
    }
    return decoded.join("");
};

output(decode(input()))
