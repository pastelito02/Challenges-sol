#Author pearl_barley
sub collatz {
  my $x = $_[0];
  $c = 0;
  while ($x > 1) {
    $c += 1;
    $x = ($x % 2 == 0) ? int($x / 2) : 3 * $x + 1;
  }
  return $c;
}

$n = <STDIN>;
@a = split(/\s+/, <STDIN>);
for ($i = 0; $i < $n; $i++) {
  print collatz($a[$i]), ' ';
}
