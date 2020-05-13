#Author pearl_barley
sub fibidx {
  my $m = $_[0];
  my $a = 0;
  my $b = 1;
  my $i = 1;
  for ($i = 1; $b % $m != 0; $i++) {
    ($b, $a) = (($b + $a) % $m, $b);
  }
  return $i;
}

<STDIN>;
@a = split /\s+/, <STDIN>;
for $v (@a) {
  $r = fibidx($v);
  print "$r ";
}
