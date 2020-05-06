<!--Author Dant12345-->
<?php

/**
 * Share Price Volatility
 */

$a = $_POST['text'];
$a = explode("\n", $a);
$percent = 0.01;

foreach ($a as $value)
{
  $arr = explode(" ", $value);
  $name = array_shift($arr);
  $arr = array_map('trim', $arr);
  $result = '';

  $avg = 0;
  for ($i = 0; $i < count($arr); $i++) {
    $avg +=$arr[$i]/count($arr);


  }
  $comis = $avg*$percent;
  $d = 0;

  for ($i = 0; $i < count($arr); $i++) {
    $d += pow($avg -$arr[$i],2)/count($arr);
  }
  $d = sqrt($d);


  if ($d >= $comis*4) {
    $result = $name;
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
