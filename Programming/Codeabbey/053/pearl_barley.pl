#Author pearl_barley
sub getx {
    return ord($_[0]) - ord("a");
}
sub gety {
    return ord(substr($_[0], 1)) - ord("0");
}
$n = <STDIN>;
while ($n-- > 0) {
    @a = split / /, <STDIN>;
    $dx = getx($a[1]) - getx($a[0]);
    $dy = gety($a[1]) - gety($a[0]);
    $r = ($dx == 0 || $dy == 0 || $dx == $dy || $dx == -$dy) ? "Y" : "N";
    print "$r ";
}