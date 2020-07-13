//Author f_martinez
function sub(a, b){ return { x: a.x - b.x, y: a.y - b.y }; }
function add(a, b){ return { x: a.x + b.x, y: a.y + b.y }; }
function mul(a, m){ return { x: a.x * m, y: a.y * m }; }
function dot(a, b){ return a.x * b.x + a.y * b.y; }
function norm(a){ return Math.sqrt(dot(a, a)); }
function d(a, b){ return norm(sub(a, b)); }

function distance(p, p0, p1){
    
    var v = sub(p1, p0), w = sub(p, p0), c1, c2;
    
    if ((c1 = dot(w, v)) <=  0) return d(p, p0);
    if ((c2 = dot(v, v)) <= c1) return d(p, p1);    
    return d(p, add(p0, mul(v, c1/c2)));
}

var r = [];
for (var i = 0, l = +input(); i<l; i++) {
    var o  = input().split(" ").map(parseFloat),
        p  = { x: o[4], y: o[5] },
        p0 = { x: o[0], y: o[1] },
        p1 = { x: o[2], y: o[3] };
    r.push(distance(p, p0, p1));
}
output( r.join(" ") );