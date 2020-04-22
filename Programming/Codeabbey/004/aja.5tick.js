//Author aja.5tick
var lines = input().split(/\n/g);
var rePeteOr = lines[0];
rePeteOr++;
var summit1g = "";

for (i = 1; i<parseInt(rePeteOr); i++)
{
    var temp = 0;
    var toSum = lines[i].split(" ");
  if (parseInt(toSum[0]) < parseInt(toSum[1]))
      {temp = parseInt(toSum[0]); }
  else
      {temp = parseInt(toSum[1]); }
  summit1g += (temp.toString() + " ");
}

output(summit1g);
