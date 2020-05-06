#Author pearl_barley
%br = ("}" => "{", ")" => "(", "]" => "[", ">" => "<");
$n = <STDIN>;
outer: while ($n-- > 0) {
  $s = <STDIN>;
  $s =~ s/[^\[\]\(\)\<\>\{\}]//g;
  @a = split "", $s;
  @x = ();
  for $c (@a) {
    if (exists $br{$c}) {
      if (scalar(@x) < 1 || pop(@x) ne $br{$c}) {
        print "0 ";
        next outer;
      }
    } else {
      push @x, $c;
    }
  }
  $r = scalar(@x) == 0 ? 1 : 0;
  print "$r ";
}
