#Author pearl_barley
$n1 = <STDIN> - 1;
@a = split /\s+/, <STDIN>;
print $a[0], " ";
$s = $a[0] + $a[1];
for ($i = 1; $i < $n1; $i++) {
    $s += $a[$i + 1];
    print $s / 3, " ";
    $s -= $a[$i - 1]; 
}
print $a[$n1];