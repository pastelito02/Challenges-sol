<!--Author KOR_Ryat-->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle,65536);
for($r=0;$r<$count;$r++){$coord[] = explode(' ',fgets($handle,128));}
for($i=0;$i<$count;$i++){
  $mX += $coord[$i][0];
  $mY += $coord[$i][1];
}
$mX /= $count;
$mY /= $count;
for($i=0;$i<$count;$i++){$asum += triArea(array($mX,$mY),$coord[$i],$coord[($i==$count-1?0:$i+1)]);}
print $asum;

function triArea($p1,$p2,$p3){
  $a = sqrt(pow($p1[0]-$p2[0],2)+pow($p1[1]-$p2[1],2));
  $b = sqrt(pow($p1[0]-$p3[0],2)+pow($p1[1]-$p3[1],2));
  $c = sqrt(pow($p2[0]-$p3[0],2)+pow($p2[1]-$p3[1],2));
  $s = ($a+$b+$c)/2;
  return sqrt($s*($s-$a)*($s-$b)*($s-$c));
}
