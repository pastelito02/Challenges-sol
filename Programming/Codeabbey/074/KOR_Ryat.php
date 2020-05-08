<!--Author KOR_Ryat-->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
$hands = explode(' ',fgets($handle,128));
for($r=0;$r<$count;$r++){
  list($h,$m) = explode(':',$hands[$r]);
  print (10+6*sin(deg2rad($h*30+$m/2))).' '.(10+6*cos(deg2rad($h*30+$m/2))).' '.(10+9*sin(deg2rad($m*6))).' '.(10+9*cos(deg2rad($m*6))).' ';
}
fclose($handle);
