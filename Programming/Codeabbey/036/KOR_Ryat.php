<!--Author KOR_Ryat-->
<?php
# should improve this shit some later day

$digit = 4;

$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($i=0;$i<$digit;$i++){$avail[$i] = array_fill(1,10,1);}
for($r=0;$r<$count;$r++){
  list($doubt,$answer) = explode(' ',fgets($handle, 128));
  unset($num);
  $x = $doubt;
  while($x>=0){
    $num[] = $x%10;
    $x = (int)($x/10);
    if($x==0){break;}
  }
  if($answer==0){for($i=0;$i<$digit;$i++){$avail[$i][$num[$i]] = 0;}}
  else{$logs[] = array($doubt,$answer);}
}

$step = 0;
while(true){
  unset($dnum);
  $x = $step;
  for($i=0;$i<$digit;$i++){
    $dnum[] = $x%9+1;
    $x = (int)($x/9);
  }
  $flag = 1;
  for($i=0;$i<count($logs);$i++){
    unset($num);
    $x = $logs[$i][0];
    while($x>=0){
      $num[] = $x%10;
      $x = (int)($x/10);
      if($x==0){break;}
    }
    $match = 0;
    for($j=0;$j<$digit;$j++){if($num[$j]==$dnum[$j]){$match++;}}
    if($match!=$logs[$i][1]){$flag = 0; break;}
  }
  if($flag==1){for($i=$digit;$i>=0;$i--){print $dnum[$i];}break;}
  $step++;
}
fclose($handle);
