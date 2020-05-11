<!--author KOR_Ryat-->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($r=0;$r<$count;$r++){
  list($d,$a) = explode(' ',fgets($handle,128));
  print round($d * tan(deg2rad($a-90))).' ';
}
fclose($handle);
