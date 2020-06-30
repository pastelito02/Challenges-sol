<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
while(true){
    $msg = explode(' ',fgets($handle, 65536));
    if($msg[0]=='Stand'){continue;}
    if($msg[0]=='Dig'){break;}
    $x += sin(deg2rad($msg[5])) * $msg[1];
    $y += cos(deg2rad($msg[5])) * $msg[1];
}
print round($x).' '.round($y);