<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
list($w,$h,$l) = explode(' ',fgets($handle, 65536));
$x = $y = $dir = 0;
for($r=0;$r<=100;$r++){
  print $x.' '.$y.' ';
  if($x+$l == $w && $dir%2==0){$dir += 1;}else if($x == 0 && $dir%2==1){$dir -= 1;}
  if($y == $h-1 && $dir<2){$dir += 2;}else if($y == 0 && $dir>1){$dir -= 2;}
  $x += $dir%2==0?1:-1;
  $y += $dir<2?1:-1;
}
fclose($handle);
