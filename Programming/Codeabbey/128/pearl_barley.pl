#Author pearl_barley
$m = <STDIN>;
while ($m-- > 0) {
  @a = split /\s+/, <STDIN>;
  $n = $a[0];
  $k = $a[1];
  if ($n - $k < $k) {
    $k = $n - $k;
  }
  $r = 1;
  for ($i = 0; $i < $k; $i++) {
    $r = $r * ($n - $i) / ($i + 1);
  }
  print $r, " ";
}
