#Author pearl_barley
$n = <STDIN>;
while ($n--) {
    ($m, $k, $r) = split /\s+/, <STDIN>;
    if ($r eq "n") {
        $x = $m % ($k + 1);
    } else {
        $x = ($m - 1) % ($k + 1);
    }
    print "$x ";
}