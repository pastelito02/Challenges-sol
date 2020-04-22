//Author DeadIntegral
var s = `28
fanaticism pretzels
MNXW24DPOJ2GKZBAMZXXEZLTORUW4ZZAN5ZGI2LOMFZGSZLTOQQHO2DJNZUW4ZZR
virtuosity foci synonymous
OJ2WEYTMMVSCA53FMFVWK3TTEBSXQ5DJOJYGC5DFEBSWG2DPMVSCA23SN5XGK4RR
east evading foreign
M5WG643TNFSXEIDTNBZGS23FEB2XA43VOJTWK4ZR
woolies
ONSXI5LQGU2TKNJV
misprint brief heighten dweller
OJXXK43UMFRG65LUOMQHG53FMV2GE4TFMFSDGMZT
clowning spry
MFXGO3DFOIQHG2DPOBYGS3THEBTG64TFMNWG643VOJSXGMRS
brood
NRQXG43JMVZSA4TBOBYHE33DNBSW2ZLOORZSA5DJNRSXGIDTNBZGK53EMVZDGMZT
existential
ON2GC3TEN5TGMMRS
dilemmas spittoon
MFWWC5DPOJ4SA3LVOJQWYIDXNFSHI2BR
wallow
NBQXEZDCMFWGYIDSMVUW443FOJ2GS3THGU2TKNJV
pleasings
OZUXEZLPOMQGI2LHNZUXIYLSPEQHI33VMNUGS3THNR4SA4TVNVYGKZBAN5QXGZLTGU2TKNJV
subsidiaries curiously headlands motherfucker buccaneered
N53GK4TFNVYGQYLTNF5GK4ZR
gantries indifference prism
MR4XGZTVNZRXI2LPNYQGE5LMNNUGKYLEOMQHAZLSMNSWS5TFEBZXIYLOMRXWMZRR
safeguards
MZXXK3TEMF2GS33OEBRWY33JON2GK4TFMQQG2YLUOVZGK4RANJ2W4Z3MMVZSA43LOVWGI5LHM5SXE6JR`.split('\n');

var list = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'.split('');
var sList = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
var result = [];

for(var i = 1, l = s[0]; i <= l; i++){
  result.push(calc(s[i]));
}

function calc(arg){
  var res = [];
  if(arg.toUpperCase() === arg){
    // decode
    arg = arg.split('').map(x => ('00000'+sList.indexOf(x).toString(2)).substr(-5)).join('');
    while(arg.length > 7){
      res.push(arg.slice(0,8));
      arg = arg.slice(8, arg.length);
    }
    res = res.map(x => String.fromCharCode(parseInt(x, 2))).join('').replace(/[0-9]/g, '');;
//     console.log(res);
    return res;
  }else{
    // encode
    arg = arg.split('');
    var str = 0;
    var last = '';
    last = arg.length - 1;
    str = (5 - arg.length % 5);
    arg[last] = arg[last] + str.toString().repeat(str);
    arg = arg.join('');
    arg = arg.split('').map( x => ('00000000'+x.charCodeAt().toString(2)).substr(-8) ).join('');
    while(arg.length > 4){
      res.push(arg.slice(0,5));
      arg = arg.slice(5, arg.length);
    }
    res = res.map( x => list[parseInt(x,2)]).join('');
//     console.log(res);
    return res;
  }
}

console.log(result.join(' '));
