//Author matthias
with (CodeAbbey.solution) {

  parseInput = function(data) {
    var rows = data.split("\n");
    input = {
      n: parseInt(rows.shift(), 10),
      tasks: rows.map(function(row) {
        var task = row.split(" ");
        return {n: parseInt(task[0], 10), k: parseInt(task[1], 10), i: parseInt(task[2], 10) };
      })
    };
  }

  solve = function() {
    var alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var binomial = function(n, k) {
      if (k < 0 || k > n) return undefined;
      if (k > 0)
        return n * binomial(n - 1, k - 1) / k;
      else
        return 1;
    }
    var get = function(n, k, i, shift = 0) {
      if (k <= 0 || k > n) return undefined;
      var bin = binomial(n, k);
      if (i < 0 || i >= bin) return undefined;
      if (k > 1) {
        var left = 0;
        var right = bin * k / n;
        for (var j = 0; right <= bin; j++) {
          if (i < right)
            return alphabet.charAt(j + shift) + get(n - j - 1, k - 1, i - left, j + shift + 1);
          var tmp = right;
          right += (right - left) * (n - j - k) / (n - j - 1);
          left = tmp;
        }
      }
      else
        return alphabet.charAt(i + shift);
    }
    result = input.tasks.map(function(task){
      return get(task.n, task.k, task.i);
    });
  }

  writeResult = function() {
    return result.join(" ");
  }

}
