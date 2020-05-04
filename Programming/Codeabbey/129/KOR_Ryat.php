<!--Author KOR_Ryat-->
<?php
$handle = fopen("./data.txt", "r");
$count = fgets($handle);
for($rpt=0;$rpt<$count;$rpt++){
  list($n,$r,$k) = explode(' ',fgets($handle));
  $k = trim($k);

  $num = array(-1=>-1);
  $min = 0;
  for($i=0;$i<$r;$i++){
    $range = 0;
    for($j=0;$j<=$n-$r;$j++){
      $min++;
      $lRange = $range;
      $range += comb($n-$min,$r-$i-1);
      if($k<$range){break;}
    }
    $num[$i] = $num[$i-1]+($j+1);
    $k -= $lRange;
  }
  unset($num[-1]);
  foreach($num as &$val){$val = base36($val);}
  print implode('',$num).' ';
}

function base36($dec){return $dec<10?$dec:chr($dec+55);}
function comb($n,$r){return (fac($n) / (fac($r) * fac($n-$r))).' ';}
function fac($n){$val = 1;for($i=1;$i<=$n;$i++){$val *= $i;}return $val;}
?>
