<!--Author KOR_Ryat-->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
$val = explode(' ',fgets($handle, 65536));

for($r=0;$r<$count;$r++){
  $f = array(0,1);
  $i = 2;
  while(true){
    $f[$i] = ($f[$i-1]+$f[$i-2])%$val[$r];
    if($f[$i]==0){break;}
    $i++;
  }
  print $i.' ';
}
