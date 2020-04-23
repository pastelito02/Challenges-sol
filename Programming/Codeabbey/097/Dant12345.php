<!-- Author Dant12345 -->
<?php

/**
 * Girls and Pigs
 * Problem #97
 */

$a = $_POST['text'];
$a = explode("\n", $a);


function searchBreast($array) {
  $count = 0;
  $arrayPossibleBreasts = searchPosiblePairLegs($array[0]);
  foreach ($arrayPossibleBreasts as $pairBreasts) {
    $countBreastPigs = $array[1] - $pairBreasts[0]*2;

    if ($countBreastPigs % $pairBreasts[1] == 0 &&
      ($countBreastPigs / $pairBreasts[1]) % 2 == 0) {
      $count++;
    }
  }
  return $count;
}

function searchPosiblePairLegs($legs) {

     for ($i = 2; $i <= $legs - 4; $i = $i+2) {
       $arrayPossiblePair = [];

       if ( ($legs -$i) % 4 == 0) {
         $arrayPossiblePair[] = $i/2;
         $arrayPossiblePair[] = ($legs-$i)/4;
       }
      if (!empty($arrayPossiblePair)) {
        $arrayPair[]= $arrayPossiblePair;
      }

     }
    return $arrayPair;
}

foreach ($a as $pairLegsAndBreasts) {
  $pairLegsAndBreasts =explode(" ",$pairLegsAndBreasts);
  $countPossibleVariations = searchBreast($pairLegsAndBreasts);
  echo $countPossibleVariations . " ";
}

?>
<html>
<form method="POST">
<textarea name='text' cols=50 rows=20 >
</textarea>
  <br>
  <input type=submit>
</form>
</html>
