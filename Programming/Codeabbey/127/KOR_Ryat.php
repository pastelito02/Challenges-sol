<!--Author KOR_Ryat-->
<?php
$handle = fopen("./dic.txt", "r");
while(true){
  $word = fgets($handle,128);
  if(!$word){break;}
  $dic[substr($word,0,-1)] = 1;
}
fclose($handle);

$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($r=0;$r<$count;$r++){
  $origin = trim(fgets($handle, 128));
  $len = strlen($origin);

  unset($order,$corr);

  while(true){
    $order[0]++;
    for($i=0;$i<$len;$i++){
      if($order[$i]==$len){
        $order[$i]=0;
        $order[$i+1]++;
      }
    }
    if($order[$len]==1){break;}

    for($i=0;$i<$len;$i++){
      for($j=0;$j<$i;$j++){
        if($order[$i]==$order[$j]){
          continue 3;
        }
      }
    }

    $str = '';
    for($i=0;$i<$len;$i++){$str .= $origin[$order[$i]];}
    if($dic[$str]==1){$corr[$str]=1;}
  }
  unset($corr[$origin]);
  print count($corr).' ';
}
fclose($handle);
