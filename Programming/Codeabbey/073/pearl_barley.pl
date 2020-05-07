#Author pearl_barley
#!/usr/bin/env perl

$PI = atan2(0, -1);
$ORD_A = ord('A');

sub calcDist {
  my $way = shift;
  chomp $way;
  my @chars = split //, $way;
  my $dx = 0;
  my $dy = 0;
  for my $c (@chars) {
    my $angle = (ord($c) - $ORD_A) * $PI / 3;
    $dx += cos($angle);
    $dy += sin($angle);
  }
  return sqrt($dx**2 + $dy**2);
}

$n = int(<>);

for ($i = 0; $i < $n; $i++) {
  $s = <>;
  print calcDist($s), ' ';
}
