//Author GeorgySerga
input();
var inputData = input();
var x = 0;
var y = 0;
while(!(~inputData.indexOf("Dig"))) {
  var distanceStringPosition = inputData.indexOf(' ') + 1;
  var distance = parseInt(inputData.slice(distanceStringPosition));
  // console.log(distance);
  var azimuthStringPosition = inputData.lastIndexOf(' ') + 1;
  var azimuth = parseInt(inputData.slice(azimuthStringPosition));
  // console.log(azimuth);
  x += (distance * Math.sin(azimuth * Math.PI / 180));
  y += (distance * Math.cos(azimuth * Math.PI / 180));
  inputData = input();
}

output(Math.round(x) + ' ' + Math.round(y));
