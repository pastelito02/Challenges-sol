<!-- Maulana Rahman Nur -->
<?php

$array = [

[5, 7, 10, 13, 16, 18],
[4, 9, 14, 19, 23],
[2, 6, 8, 10, 13, 15],
[2, 7],
[1, 4],
[3, 6, 9, 14, 16],
[1, 5, 9],
[4, 6, 8, 11],
[1, 3, 7, 10, 15, 20, 24],
[5, 9, 13],
[4, 8, 10, 13, 15, 18],
[5, 9, 11, 13, 16, 20],
[1, 5, 9, 13, 17],
[4, 7, 9, 13, 15, 19],

];

// $sum = 0;
for ($i=0; $i < count($array); $i++) {
    $sum = 0;
    for ($j=0; $j < count($array[$i]); $j++) {
        $sum = $sum + ($array[$i][$j]*$array[$i][$j]);
    }
    echo $sum." ";
}

?>