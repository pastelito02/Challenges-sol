<!--Author KOR_Ryat-->
$letter = array('bcdfghjklmnprstvwxz','aeiou');

$handle = fopen("./data.txt", "r");
list($x) = explode(' ',fgets($handle, 128));
fclose($handle);
for($r=0;$r<900000;$r++){
    unset($word);
    for($i=0;$i<6;$i++){
        $x = (445 * $x + 700001) % 2097152;
        $word .= $letter[$i%2][$x%($i%2==0?19:5)];
    }
    $list[$word]++;
}
arsort($list);
print key($list);