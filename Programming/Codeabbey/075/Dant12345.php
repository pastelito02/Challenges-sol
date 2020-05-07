<!--Author Dant12345-->
<?php

/**
 * Yacht or Dice Poker
 * Problem #75
 */

$a = $_POST['text'];

$a = explode("\n",$a);
$x = array_fill(1, 5, true);
$y = array_fill(2, 6, true);

foreach ($a as $value)
{
  $arr = explode(" ", $value);
  $arr = array_map('trim',$arr);
  $res = array_count_values($arr);
  $result = "none";
  if (count($res) ==1 ) {
    $result = 'yacht';
  }
  if (count($res) == 2 and in_array(4, $res)) {
    $result = 'four';
  }
  if (count($res) == 2 and in_array(3, $res)) {
    $result = 'full-house';
  }
  if (count($res) == 3 and in_array(2,$res)) {
    $result = 'two-pairs';
  }
  if (count($res) == 3 and in_array(3,$res)) {
    $result = 'three';
  }
  if (count($res) == 4) {
    $result = 'pair';
  }
  if (count($res) == 5){
    $z  = array_diff_key($res, $x);
    if (empty($z)) {
      $result = 'small-straight';
    }
  }
  if (count($res) == 5){
    $z  = array_diff_key($res, $y);
    if (empty($z)) {
      $result = 'big-straight';
    }
  }
echo $result . " ";
}

?>
<html>
<form method="POST">
<textarea name='text' cols=50 rows=20 >
</textarea>
  <br>
  <input type=submit>
</form>
</html>
