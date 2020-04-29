<!-- Author missimlab -->
<?php

$entries = file('./entryFiles/p6.txt');
$arrResult = [];
foreach($entries as $entry) {
    $numbers = explode(' ', str_replace("\n", "", $entry));
    $float = $numbers[0] / $numbers[1];
    if($float >= 0) {
        if(($float - (int)$float) >= 0.5) {
            $arrResult[] = (int) $float + 1;
        } else {
            $arrResult[] = (int)$float;
        }
    } else {
        if((abs($float - (int)$float)) < 0.5) {
            $arrResult[] = (int) $float ;
        } else {
            $arrResult[] = (int) $float - 1;
        }
    }
}

echo implode(' ', $arrResult);
