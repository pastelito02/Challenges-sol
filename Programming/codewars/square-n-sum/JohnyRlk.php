<?php
function square_sum($n) : int {

  return array_sum(array_map(function($v){return $v * $v;}, $n));

}
?>
