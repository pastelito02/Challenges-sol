<!-- Author CodyMaker -->
<?php
$N = readline();
$input = "";
for ($i = 0; $i < $N; $i++)
{
    $str = readline();
    $x = explode (" ", $str);
    $N1 = count($x);
    $sum = 0;
    for ($j = 0; $j < $N1; $j++)
    {
        $sum = $sum + $x[$j] * $x[$j];
    }
    $input .= $sum.' ';
}
echo $input;
?>
