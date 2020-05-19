#Author pearl_barley
@a = split /\s+/, <STDIN>;
$n = $a[0];
$k = 26 - $a[1];
$ordA = ord("A");
while ($n-- > 0) {
    @s = split "", <STDIN>;
    $r = "";
    for ($i = 0; $s[$i] ne "."; $i++) {
        $c = $s[$i];
        if ($c ne " ") {
            $c = chr((ord($c) - $ordA + $k) % 26 + $ordA);
        }
        $r .= $c;
    }
    print "$r. ";
}