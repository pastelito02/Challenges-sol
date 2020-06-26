#Author pearl_barley
@suits = ("Clubs", "Spades", "Diamonds", "Hearts");
@ranks = (2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace");
<STDIN>;
@a = split / /, <STDIN>;
for $v (@a) {
    print $ranks[$v % 13] . "-of-" . $suits[int($v / 13)] . " ";
}