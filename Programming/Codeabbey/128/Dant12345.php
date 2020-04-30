<!--Author Dant12345-->
<?php
if ($k === 0) {

$res = 1;
}
else {
$res =1 ;
for ($j = 0;  $j <= $k -1 ; $j++)
{
    $res *= ($n - $j)/($j + 1);
}
}
echo $res . " ";
?>
