#Author pearl_barley
sub loop_count {
    my $v = $_[0];
    my %h = ($v => 1);
    my $c = 0;
    while (1) {
        $v = int(($v * $v) / 100) % 10000;
        $c += 1;
        if (exists $h{$v}) {
            last;
        }
        $h{$v} = 1;
    }
    return $c;
}

$n = <STDIN>;
@a = split /\s+/, <STDIN>;
for ($i = 0; $i < $n; $i++) {
    print loop_count($a[$i]), " ";
}