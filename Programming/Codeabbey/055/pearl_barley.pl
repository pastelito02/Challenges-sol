#Author pearl_barley
@a = split /\s+/, <STDIN>;
%words = ();
%res = ();
for $w (@a) {
    if (!$words{$w}) {
        $words{$w} = 1;
    } else {
        $res{$w} = 1;
    }
}
print join(" ", sort(keys(%res)))