#Author pearl_barley
sub heron {
  my $x = $_[0];
  my $n = $_[1];
  my $r = 1;
  while ($n-- > 0) {
    $r = ($r + $x / $r) / 2;
  }
  return $r;
}

$n = <STDIN>;
while ($n-- > 0) {
  @a = split(/\s+/, <STDIN>);
  print heron($a[0], $a[1]), ' ';
}
