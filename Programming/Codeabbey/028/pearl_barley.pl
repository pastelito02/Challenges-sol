#Author pearl_barley
sub bmi {
    my $x = $_[0];
    if ($x < 25) {
        return ($x < 18.5) ? "under" : "normal";
    } else {
        return ($x < 30) ? "over" : "obese";
    }
}

$n = <STDIN>;
while ($n-- > 0) {
    @a = split(/\s+/, <STDIN>);
    print bmi($a[0]/$a[1]**2), ' ';
}