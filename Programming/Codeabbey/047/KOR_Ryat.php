<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = explode(' ',fgets($handle, 128));
for($r=0;$r<$count[0];$r++){
    $string = fgets($handle, 65536);
    for($i=0;$i<strlen($string);$i++){
        $ord = ord($string[$i]);
        if($ord == 32 || $ord == 46 || $ord == 10){print $string[$i]; continue;}
        print chr($ord - $count[1] + ($ord-$count[1]<65?26:0));
    }
}
fclose($handle);