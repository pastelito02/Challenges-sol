#Author pearl_barley
sub chsum {
    my @a = @{$_[0]};
    $n = scalar(@a);
    $res = 0;
    for ($i = 0; $i < $n; $i++) {
        $res = ($res + $a[$i]) % 10000007 * 113 % 10000007;
    }
    return $res;
}

$n = <STDIN>;
@a = split(/\s+/, <STDIN>);
print chsum(\@a);