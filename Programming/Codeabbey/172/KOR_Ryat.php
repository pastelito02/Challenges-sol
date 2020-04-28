<!-- Author KOR_Ryat -->
$handle = fopen("./data.txt", "r");
$count = fgets($handle,65536);
for($r=0;$r<$count;$r++){
    list($d1,$a,$b) = explode(' ',fgets($handle,65536));
    print round(-1 * $d1 * tan(deg2rad($a)) / (tan(deg2rad($a)) - tan(deg2rad($b))) * tan(deg2rad($b))).' ';
}
