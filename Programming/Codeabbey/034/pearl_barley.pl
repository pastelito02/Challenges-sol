#Author pearl_barley
sub findmin {
  $lt = 0;
  $rt = 100;
  while ($rt - $lt > 1e-8) {
    $xm = ($rt + $lt) / 2;
    $ym = $a * $xm + $b * ($xm ** 1.5) - $c * exp(-$xm / 50) - $d;
    if ($ym > 0) {
      $rt = $xm;
    } else {
      $lt = $xm;
    }
  }
  return $xm;
}
$n = <STDIN>;
while ($n-- > 0) {
  ($a, $b, $c, $d) = split / /, <STDIN>;
  print findmin(), " ";
}
