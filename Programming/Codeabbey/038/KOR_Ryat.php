<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($i=0;$i<$count;$i++){
    $val = explode(' ',fgets($handle, 128));

    $d = $val[1]*$val[1]-4*$val[0]*$val[2];
    $a = -1*$val[1]/($val[0]*2);

    if($d<0){
        $b = sqrt(-1*$d)/($val[0]*2);
        print $a.'+'.$b.'i '.$a.'-'.$b.'i; ';
    }else{
        $b = sqrt($d)/($val[0]*2);
        print ($a+$b).' '.($a-$b).'; ';
    }
}
fclose($handle);