//Author ZozoFouchtra
var DY = 0.8660254037844386,
DELTAS = { A:{x:1,y:0}, B:{x:.5,y:DY}, C:{x:-.5,y:DY}, D:{x:-1,y:0}, E:{x:-0.5,y:-DY}, F:{x:0.5,y:-DY} }

var i = input(), res = [];
while(i--){
  var move = input()
    .split('')
    .reduce(function(mv,d){var delta=DELTAS[d]; return {x:mv.x+delta.x, y:mv.y+delta.y}},{x:0,y:0})
  res.push( Math.sqrt(move.x*move.x + move.y*move.y).toFixed(7) )
}

output( res.join(' ') )
