//Author Vladislav Kondratov
class Base32Encoding {
  constructor() {
      this.chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
      this.runTask();
  }

  runTask() {
      const rounds = +input();
      const result = new Array(rounds).fill(null).map((_, index) => index % 2 ? this.decodeFromBase32(input()) : this.encodeInBase32(input()))
      output(result.join(" "));
  }

  encodeInBase32(word) {
      let add = word.length % 5 ? 5 - word.length % 5 : 5;
      word += `${add}`.repeat(add);
      let string = ([...word].reduce((result, letter) => result + ("0".repeat(8) + letter.charCodeAt().toString(2)).slice(-8), ""));
      return (string.match(/\d{5}/g).reduce((string, number) => string + this.chars[parseInt(number, 2)], ""))
  }

  decodeFromBase32(word) {
      let binaryString = ([...word].reduce((result, letter) => result +  ("0".repeat(5) + this.chars.indexOf(letter).toString(2)).slice(-5), ""));
      let string = (binaryString.match(/\d{8}/g).reduce((string, binary) => string + String.fromCharCode(parseInt(binary, 2)), ""));
      return (string.replace(/\d+$/, ""))
  }
}
new Base32Encoding();
