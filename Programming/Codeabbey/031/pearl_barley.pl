#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
    @a = split /\s+/, <STDIN>;
    $s = $a[1];
    $m = length($s);
    $p = $a[0] > 0 ? $a[0] : $m + $a[0];
    $s = substr($s, $p) . substr($s, 0, $p);
    print "$s ";
}