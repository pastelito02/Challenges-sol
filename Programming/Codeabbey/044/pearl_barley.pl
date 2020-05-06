#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
  @a = split / /, <STDIN>;
  $r = 2;
  for ($i = 0; $i < scalar(@a); $i++) {
    $r += $a[$i] %= 6;
  }
  print "$r ";
}
