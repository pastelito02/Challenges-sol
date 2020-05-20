<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 256);
for($r=0;$r<$count;$r++){
    list($a,$b,$n) = explode(' ',fgets($handle, 65536));
    $bin = dec2bin($b);
    $mod = array($a%$n);
    for($i=1;$i<count($bin);$i++){$mod[$i] = ($mod[$i-1]*$mod[$i-1])%$n;}
    $x = 1;
    for($i=0;$i<count($bin);$i++){
        if($bin[$i]==0){continue;}
        $x = ($x*$mod[$i])%$n;
    }
    print $x.' ';
}

function dec2bin($x){
    while($x>0){
        $bin[] = $x%2;
        $x = (int)($x/2);
    }
    return $bin;
}