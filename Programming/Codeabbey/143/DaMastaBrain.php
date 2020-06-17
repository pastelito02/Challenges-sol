<!--Author DaMastaBrain-->
<?php

function gcd($a, $b) {
    $gcd = 0;

    while (!$gcd) {
        if ($a > $b) {
            $a %= $b;

            if ($a == 0) {
                $gcd = $b;
            }
        } else {
            $b %= $a;

            if ($b == 0) {
                $gcd = $a;
            }
        }
    }

    return $gcd;
}

function bezout($X, $Y) {
    $aPrev = $bCur = 1;
    $bPrev = $aCur = 0;

    do {
        $r = $X % $Y;
        $q = ($X - $r) / $Y;

        $aNext = $aPrev - $q * $aCur;
        $bNext = $bPrev - $q * $bCur;

        $X = $Y;
        $Y = $r;

        $aPrev = $aCur;
        $aCur  = $aNext;
        $bPrev = $bCur;
        $bCur  = $bNext;
    } while ($r > 0);

    return [$aPrev, $bPrev];
}

for ($cases = rtrim(fgets(STDIN)), $i = 0; $i < $cases; $i++) {
    list ($X, $Y) = explode(' ', rtrim(fgets(STDIN)));

    $gcd = gcd($X, $Y);

    if ($Y > $X) {
        list ($b, $a) = bezout($Y, $X);
    } else {
        list ($a, $b) = bezout($X, $Y);
    }

    echo "{$gcd} {$a} {$b} ";
}