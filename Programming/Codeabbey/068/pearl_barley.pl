#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
  @a = split /\s+/, <STDIN>;
  print $a[0] * $a[1] / ($a[1] + $a[2]), ' ';
}
