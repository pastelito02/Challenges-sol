<!--Author doormaker-->
<?php
$list = "50 23 21 45 30 40 42 13 5 9 7 18 24 4 17 10 12 39 46 31 28 8 16 29 37 41";
$list_array = explode(" ", $list);
$count = count($list_array);
$suits = ['Clubs', 'Spades', 'Diamonds', 'Hearts'];
$ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'];


for($i = 0; $i < $count; $i++) {
    $suit = floor($list_array[$i] / 13);
    $rank = $list_array[$i] % 13;
    
    echo $ranks[$rank] . "-of-" . $suits[$suit] . " ";
}


?>