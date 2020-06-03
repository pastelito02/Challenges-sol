#Author pearl_barley
sub gcd {
    my $a = $_[0];
    my $b = $_[1];
    while ($b > 0) {
        $a %= $b;
        my $t = $a;
        $a = $b;
        $b = $t;
    }
    return $a;
}

$n = <STDIN>;

while ($n-- > 0) {
    @a = split(/\s+/, <STDIN>);
    $g = gcd($a[0], $a[1]);
    $m = int($a[0] * $a[1] / $g + 0.1);
    print "($g $m) ";
}