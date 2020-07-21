<?php
#Tester555
function expressionMatter($a, $b, $c) {
  return max([
      $a+$b+$c,
      ($a+$b)*$c,
      $a*($b+$c),
      $a+$b*$c,
      $a*$b+$c,
      $a*$b*$c
  ]);
}
?>
