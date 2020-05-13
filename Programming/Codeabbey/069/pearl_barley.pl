#Author pearl_barley
sub fibindex {
  my $a = 0;
  my $b = 1;
  my $i = 1;
  my $d = $_[0];
  while ($b != 0) {
    my $c = ($a + $b) % $d;
    $a = $b;
    $b = $c;
    $i += 1;
  }
  return $i;
}

<STDIN>;
@a = split / /, <STDIN>;
for $d (@a) {
  print fibindex($d), " ";
}
