<?php
function getGrade($a, $b, $c) {
  $tmp = ($a + $b + $c) / 3;
  if($tmp >= 90) return 'A';
  if($tmp >= 80) return 'B';
  if($tmp >= 70) return 'C';
  if($tmp >= 60) return 'D'; else return 'F';
}
?>
