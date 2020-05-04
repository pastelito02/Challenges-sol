#Author funboixer
#!/usr/bin/perl

use strict;
use warnings;
use Math::Round;

my @in = <STDIN>;
shift(@in);
my @hold;
my @values;
my $foo;
my $i;
my $baz;
foreach (@in){
    @values = split(' ', $_);
    $i = 0;
    $foo = 0;
    pop(@values);
    foreach(@values){
      $foo += $_;
      $i++;
     }
    $baz = ($foo / $i);
  push(@hold, round($baz));
}



foreach (@hold){
     print "$_ ";
}
