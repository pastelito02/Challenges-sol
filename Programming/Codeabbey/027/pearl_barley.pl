#Author pearl_barley
$n = <STDIN>;
@a = split /\s+/, <STDIN>;
$swaps = 0;
$passes = 0;
while (1) {
    $sp = 0;
    for ($i = 1; $i < $n; $i++) {
        if ($a[$i] < $a[$i - 1]) {
            $a[$i] += $a[$i - 1];
            $a[$i - 1] = $a[$i] - $a[$i - 1];
            $a[$i] -= $a[$i - 1];
            $sp += 1;
        }
    }
    $passes += 1;
    if ($sp == 0) {
        last;
    }
    $swaps += $sp;
}
print "$passes $swaps";