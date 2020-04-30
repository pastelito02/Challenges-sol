<!--Author Dant12345-->
<?php
foreach ($a as $value)
{
  $arr = explode(" ", $value);
  $area = triangleS($arr);
 echo $area . " ";
}
function triangleS($array) {
  list($x1, $y1, $x2, $y2, $x3, $y3) = $array;
  $a = sqrt(pow(abs($x1-$x2),2) + pow(abs($y1-$y2),2));

  $b = sqrt(pow(abs($x1-$x3),2) + pow(abs($y1-$y3),2));

  $c = sqrt(pow(abs($x2-$x3),2) + pow(abs($y2-$y3),2));

  $s = ($a+$b+$c)/2;

  $area = sqrt($s*($s - $a)*($s - $b)*($s - $c));

  return $area;
}
?>
