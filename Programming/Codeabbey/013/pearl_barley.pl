#Author pearl_barley
sub wsd {
  # with division we got digits backwards so use a little trick
  my $r = 0;
  my $s = 0;
  my $x = $_[0];
  $c = 0;
  while ($x > 0) {
    my $d = $x % 10;
    $s += $d;
    $r += $d * $c;
    $x = int($x / 10);
    $c -= 1;
  }
  return $r - $c * $s;
}

<STDIN>;
@a = split /\s+/, <STDIN>;
for $v (@a) {
  print wsd($v), ' ';
}
