#Author pearl_barley
#!/usr/bin/env perl

# x = pA + (1 - pA) * (1 - pB) * x
# 1 = pA / x + (1 - pA) * (1 - pB)
# x = pA / (1 - (1 - pA) * (1 - pB))

$n = <>;

for ($i = 0; $i < $n; $i++) {
  $s = <>;
  ($pA, $pB) = map { $_ / 100} split(/ /, $s);
  $x = int($pA / (1 - (1 - $pA) * (1 - $pB)) * 100 + 0.5);
  print "$x ";
}
