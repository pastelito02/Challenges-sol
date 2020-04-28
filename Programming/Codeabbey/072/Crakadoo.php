<!-- Author Crakadoo -->
<?php
echo '<b>Funny words generator</b><br><br>';
$consonant = 'bcdfghjklmnprstvwxz';
$vowels = 'aeiou';
$rand = 151168;
$arr_len = array(6, 6, 8, 8, 4, 3, 6, 7, 4, 3, 7, 8, 3, 5, 5, 7, 6, 7, 6, 5, 4);

function get_random($x)
{
    $a = 445;
    $m = 2097152;
    $c = 700001;
    $number = ($a * $x + $c) % $m;
    return $number;
}
for($y = 0; $y < 21; $y++)
{
    $end = $arr_len[$y];
        #echo 'index='.$y.' end='.$end;

    for($i = 1; $i < $end + 1; $i++)
    {
        $rand = get_random($rand);
        $mod = 19;
        $odd = true;
        if($i <> 1 and ($i % 2) == 0){
            $mod = 5;
            $odd = false;
        }
        $index = $rand % $mod;
        if($odd){
            echo $consonant[$index];
        }
        else{
            echo $vowels[$index];
        }
    }
    echo '<br><br>';
}
?>
