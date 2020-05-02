#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
  @a = split(/\s+/, <STDIN>);
  print $a[2] * (($a[2] - 1) * $a[1] / 2 + $a[0]), " ";
}
