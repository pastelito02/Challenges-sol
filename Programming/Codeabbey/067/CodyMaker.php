<!--Author CodyMaker-->
<?php
$N = readline();
$input = "";
for ($i = 0; $i < $N; $i++)
{
  $number = 0;
  $str = readline();
  if (strlen($str) > 8)
    $number = substr($str, -8);
  else $number = $str;
  $b = 0;
  $c = 1;
  $k = 1;
  while ($b != $number && $c != $number)
  {
    if ($k % 2 == 1)
      $b = ($b + $c) % 100000000;
    else $c = ($c + $b) % 100000000;
    $k++;
  }
  $input .= $k.' ';
}
echo $input;
?>
