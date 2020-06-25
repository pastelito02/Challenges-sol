#Author pearl_barley
@suits = split //, "CDHS";
@ranks = split //, "A23456789TJQK";
@a = split /\s+/, <STDIN>;
$n = scalar(@a);
@deck = ();
for ($i = 0; $i < $n; $i++) {
    $deck[$i] = $suits[int($i / 13)] . $ranks[$i % 13];
}
for ($i = 0; $i < $n; $i++) {
    $j = $a[$i] % $n;
    $t = $deck[$i];
    $deck[$i] = $deck[$j];
    $deck[$j] = $t;
}
print join " ", @deck;