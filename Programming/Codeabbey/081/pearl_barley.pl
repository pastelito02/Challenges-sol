#Author pearl_barley
<STDIN>;
@a = split / /, <STDIN>;
for $s (@a) {
  if ($s < 0) {
    $s += 1 << 32;
  }
  $r = 0;
  while ($s != 0) {
    $r += $s & 1;
    $s >>= 1;
  }
  print "$r ";
}
