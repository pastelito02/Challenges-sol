#Author pearl_barley
#!/usr/bin/env perl

$n = <>;
@a = split / /, <>;

for ($j = $n - 1; $j > 0; $j--) {
    $m = 0;
    for ($i = 1; $i <= $j; $i++) {
        if ($a[$i] > $a[$m]) {
            $m = $i;
        }
    }
    print "$m ";
    $t = $a[$m];
    $a[$m] = $a[$j];
    $a[$j] = $t;
}