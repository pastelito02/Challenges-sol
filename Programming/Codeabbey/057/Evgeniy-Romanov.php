<!--Author Evgeniy Romanov-->
<?php
$count = readline();
$arr = explode(' ', readline());
$result = $arr[0] . ' ';
for ($index = 1; $index < count($arr) - 1; $index++) {

    $result .= ($arr[$index - 1] + $arr[$index] + $arr[$index + 1]) / 3;
    $result .= ' ';
}
$result .= $arr[count($arr) - 1];
echo $result;