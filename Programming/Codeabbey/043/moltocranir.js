//Author moltocranir
var lines = parseInt(input());

var result = [];

for (var i = 0; i < lines; i++)
{
  var rand_int = parseFloat(input());

  var roll = Math.floor(rand_int * 6) + 1;

  result.push(roll);
}

output(result.join(" "));
