#Author pearl_barley
use POSIX;
<STDIN>;
$x = 0;
$y = 0;
while (1) {
    $s = <STDIN>;
    if (substr($s, 0, 3) eq "Dig") {
        last;
    }
    ($dist, $az) = $s =~ m/(\d+)\D+(\d+)/;
    $az *= 3.1415926535 / 180;
    $y += cos($az) * $dist;
    $x += sin($az) * $dist;
}
$x = floor($x + 0.5);
$y = floor($y + 0.5);
print "$x $y";