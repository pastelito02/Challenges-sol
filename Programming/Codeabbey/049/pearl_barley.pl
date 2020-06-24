#Author pearl_barley
%outcome = ("RS" => 1, "SP" => 1, "PR" => 1);
@ko = keys %outcome;
for $k (@ko) {
    $outcome{scalar(reverse $k)} = -1;
}
$n = <STDIN>;
while ($n-- > 0) {
    $r = 0;
    @a = split /\s+/, <STDIN>;
    for $s (@a) {
        $r += $outcome{$s};
    }
    $r = $r > 0 ? 1 : 2;
    print "$r ";
}