<!--Author uncletobe-->
<?php
$str = "34 44 38 12398 28371 233 1987 2463 446 357 37 217 4240 31265 347 22885 74 2638";
$arr = explode(" ", $str);
$result = "";

foreach ($arr as $elem) {
  $result .= (collatz($elem))." ";
}

function collatz($num) {
  $step = 0;
  while ($num != 1) {
    if($num % 2 == 0) {
      $num /= 2;
      $step++;
    } else {
      $num = $num * 3 + 1;
      $step++;
    }
  }
return $step;
}

echo $result;

?>
