#Author pearl_barley
$n = <STDIN>;
while ($n-- > 0) {
    @a = split /\s+/, <STDIN>;
    $sum = 0;
    $aces = 0;
    for $x (@a) {
        if ($x eq "A") {
            $sum += 1;
            $aces +=1;
        } elsif (index("TJQK", $x) >= 0) {
            $sum += 10;
        } else {
            $sum += $x;
        }
    }
    while ($aces > 0 && $sum <= 11) {
        $sum += 10;
        $aces -= 1;
    }
    if ($sum > 21) {
        $sum = "Bust";
    }
    print "$sum ";
}