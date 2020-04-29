<!-- Author CodyMaker -->
<?php
$N = readline();
$input = "";
for ($i = 0; $i < $N; $i++)
{
  $str = readline();
  $a = explode(" ", $str);
  $k = ($a[3] - $a[1]) / ($a[2] - $a[0]);
  $b = $a[3] - $k * $a[2];
  $input .= '('.$k.' '.$b.") ";
}
echo $input;
?>
