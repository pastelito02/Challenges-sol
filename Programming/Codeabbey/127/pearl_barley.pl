#Author pearl_barley
sub wkey {
  my $word = $_[0];
  $word =~ s/[^a-z]//g;
  return join "", sort(split //, $word);
}

%words = ();
open($fwords, '<', 'words.txt');
while ($word = <$fwords>) {
  $w = wkey($word);
  if (!exists $words{$w}) {
    $words{$w} = 0;
  }
  $words{$w} += 1;
}

@res = ();
$n = <STDIN>;
while ($n--) {
  $word = <STDIN>;
  $word = wkey($word);
  push @res, $words{wkey($word)} - 1;
}
print join(" ", @res), "\n";
