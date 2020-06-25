#Author pearl_barley
@a = split /\s+/, <STDIN>;
$n = $a[0];
$k = $a[1];
@x = ();
for ($i = 0; $i < $n; $i++) {
    push @x, $i + 1;
}
$c = 1;
while ($n > 1) {
    $t = shift @x;
    if ($c != $k) {
        push @x, $t;
        $c += 1;
    } else {
        $n -= 1;
        #print $t, " ";
        $c = 1;
    }
}
print $x[0];