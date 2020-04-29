<!-- Author rasheedsaeedwirral -->
<?php

$data = '-6299177 4117569 8429 1704 18421 1864 1752786 4748836 -2608787 -4276472 2784254 1092994 3448628 744 547546 4123943 -5668752 4979413 15245 1018 1786974 571 4933 1758';
$numbers = explode(' ' , $data);

for ($i = 0, $sum = 0; $i < count($numbers); $i++, $sum =0) {
    if ($i % 2 == 0)
       echo round($sum = $numbers[$i] / $numbers[$i+1]).' ';
    else
        continue;
}
