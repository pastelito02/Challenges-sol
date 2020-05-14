#Author pearl_barley
$a = 1;
$b = 1;
%fib = ();
for ($i = 3; $i < 1000; $i++) {
  $c = ($a + $b) % 10000000;
  $fib{$c} = $i;
  $a = $b;
  $b = $c;
}
$n = <STDIN>;
while ($n-- > 0) {
  $s = <STDIN>;
  $s =~ s/\s//g;
  if (length($s) > 7) {
    $s = substr $s, -7;
  }
  print $fib{int($s)}, " ";
}
