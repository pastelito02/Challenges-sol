//Author matthias
with (CodeAbbey.solution) {

  parseInput = function(data) {
    var rows = data.split("\n");
    input = {
      n: parseInt(rows[0], 10),
      notes: rows[1].split(" ")
    };
  }

  solve = function() {
    var a4 = 440;
    var single = Math.pow(2, 1 / 12);
    var octave = "C C# D D# E F F# G G# A A# B".split(" ");
    result = input.notes.map(function(note){
      var base = note.substring(note.length - 1);
      base = a4 * Math.pow(2, parseFloat(base) - 4);
      var relative = note.substring(0, note.length - 1);
      relative = Math.pow(single, octave.indexOf(relative) - 9);
      return base * relative;
    });
  }

  writeResult = function() {
    return result.map(function(pitch){return Math.round(pitch)}).join(" ");
  }

}
