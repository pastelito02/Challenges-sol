<?php
#Koshkin
function is_divisible($n, $x, $y) {
  return ($n > 0 && (($n % $x) === 0) && ($n % $y) === 0) ? true : false;
}
?>
