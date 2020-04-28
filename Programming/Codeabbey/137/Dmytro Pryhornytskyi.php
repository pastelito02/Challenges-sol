<!-- Dmytro Pryhornytskyi -->
<?php

$text=fgets(STDIN);

$chars=array(); for($i=0;$i<strlen($text);$i++) if (isset($chars[$text[$i]])) $chars[$text[$i]]++; else $chars[$text[$i]]=1;

foreach($chars as $char=>$v) $chars[$char]=$v<<8|(255-ord($char)); arsort($chars); foreach($chars as $char=>$v) $chars[$char]=$v>>8;

$table=array(); foreach($chars as $char=>$v) $table[]=array($char,$v);

$code=array(); buildCode($table);

foreach($chars as $char=>$v) echo ord($char).' '.$code[$char].' ';


function buildCode($table,$cword='')
{ global $code; if (count($table)==1) { $code[$table[0][0]]=$cword; return; }
  $sum=0; foreach($table as $el) $sum+=$el[1];
  $lsum=0; $min=1e6; $mini=0; for($i=0;$i<count($table)-1;$i++)
  { $lsum+=$table[$i][1]; $rsum=$sum-$lsum; $diff=abs($lsum-$rsum);
    if ($diff<$min) { $min=$diff; $mini=$i; } }
  buildCode(array_slice($table,0,$mini+1),$cword.'O'); buildCode(array_slice($table,$mini+1),$cword.'I'); }

?>
