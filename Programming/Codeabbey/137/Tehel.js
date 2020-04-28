//Author Tehel
const line = input().split('');

const freqs = {};
line.forEach(c => freqs[c] = (freqs[c] || 0) + 1);
const letters = Object.keys(freqs).map(c => ({c, w:freqs[c] }));
letters.sort((a,b) => a.w>b.w ? -1 : a.w<b.w ? 1 : a.c > b.c ? 1 : -1);

const split = (letters, base) => {
    if (letters.length === 1) {
        letters[0].s = base;
    } else {
        const total = letters.reduce((s, a) => s+a.w, 0);
        let pos = 0;
        let sum = 0;
        let best = Infinity;
        while (true) {
            sum += letters[pos].w;
            pos += 1;
            const diff = Math.abs(total - 2* sum);
            if (diff >= best) {
                pos -= 1;
                break;
            }
            best = diff;
        }
        split(letters.slice(0, pos), base + 'O');
        split(letters.slice(pos), base + 'I');
    }
};
split(letters, '');
output(letters.map(e => `${e.c.charCodeAt(0)} ${e.s}`).join(' '));
