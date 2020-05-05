#Author pearl_barley
sub chsum {
  my @a = @{$_[0]};
  $n = scalar(@a);
  $res = 0;
  for ($i = 0; $i < $n; $i++) {
    $res = ($res + $a[$i]) % 10000007 * 113 % 10000007;
  }
  return $res;
}

@a = split /\s+/, <STDIN>;
pop @a;
$n = scalar(@a);
$m = 0;
for ($i = 1; $i < $n; $i++) {
  $t = $a[$i - 1];
  if ($t > $a[$i]) {
    $a[$i - 1] = $a[$i];
    $a[$i] = $t;
    $m += 1;
  }
}
print "$m ", chsum(\@a);
