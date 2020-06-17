//Author Hyuto
const n = +input();
for(let i = 0; i<n; i++){
    let [x,y] = Array.from(input().split(' '),Number);
    let Sprev = 1, Scur  = 0, Tprev = 0, Tcur  = 1;
    let max = Math.max.apply(null,[x,y]), min = Math.min.apply(null,[x,y])
    while(max%min>0){
        let q = Math.floor(max/min), r = max%min;
        let Snext = Sprev - q * Scur, Tnext = Tprev - q * Tcur;
        max = min; min = r; Sprev = Scur; Tprev = Tcur; Scur = Snext; Tcur = Tnext;
    }
    if(Scur*x + Tcur*y == gcd(x,y)) output(min+' '+Scur+' '+Tcur+' ')
    else output(min+' '+Tcur+' '+Scur+' ')
}

function gcd(a, b){
    if(a == 0) return b  
    return gcd(b%a, a)
}