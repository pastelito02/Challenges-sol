#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
  ($x1, $y1, $x2, $y2, $x3, $y3) = split / /, <STDIN>;
  $ax = $x2 - $x1;
  $ay = $y2 - $y1;
  $bx = $x3 - $x1;
  $by = $y3 - $y1;
  $r = abs($ax * $by - $ay * $bx) / 2;
  print "$r ";
}
