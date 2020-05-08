#Author pearl_barley
#!/usr/bin/env perl

$n = <>;
@input = split(/\s+/, <>);

$pi = atan2(0, -1);

for $t (@input) {
  @time = split(/\:/, $t);
  $ha = ($time[0] + $time[1] / 60) * $pi / 6;
  print 10 + 6 * sin($ha), ' ', 10 + 6 * cos($ha), ' ';
  $ma = $time[1] * $pi / 30;
  print 10 + 9 * sin($ma), ' ', 10 + 9 * cos($ma), ' ';
}
