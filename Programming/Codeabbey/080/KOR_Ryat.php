<!--Author -->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($r=0;$r<$count;$r++){
  list($pA,$pB) = explode(' ',fgets($handle,128));
  print round($pA / ($pA+$pB-$pA*$pB/100)).' ';
}
?>
