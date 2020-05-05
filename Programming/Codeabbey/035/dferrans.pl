#Author dferrans
use strict;
use warnings;

my @array = ();
my $counter = 0;
my @finalresult = ();

foreach my $line ( <STDIN> ){
  my $answer = $line ;
  my @result = ();
  my @splitzero = ();

  if ($counter > 0){

     my @values = split(/ /, $answer);
     my $interest = $values[2]/100;
     my $goal = $values[1];
     my $seed_capital = $values[0];
     my $years = 0;
     while ($seed_capital <  $goal) {
       $seed_capital = $seed_capital * (1 + $interest );
       $years += 1;
     }

     push(@result,  $years);
     push(@finalresult,  join(" ",@result));
  }
  $counter ++;
}


print join(" ", @finalresult);
