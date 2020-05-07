<!--Author Dant12345-->
<?php

/**
 * Hexagonal Grid
 * Problem #73
 */

$a =$_POST['text'];

$a = explode("\n", $a);

function searchFinishCoordinates($array)
{   $finishCoordinateX = 0;
  $finishCoordinateY = 0;
  for($i = 0; $i< count($array); $i++) {
    $arrayIntermediateCoordinates = determineTheStep($array[$i]);
    $finishCoordinateX += $arrayIntermediateCoordinates[0];
    $finishCoordinateY += $arrayIntermediateCoordinates[1];
  }
  $finishCoordinate[] = $finishCoordinateX;
  $finishCoordinate[] = $finishCoordinateY;
  return $finishCoordinate;
}

function findLength($array)
{   $array = searchFinishCoordinates($array);
  $length = sqrt(pow($array[0],2) + pow($array[1],2));
  return $length;
}

foreach ($a as $value)
{
  $arrayOfLetters = str_split($value);
  echo findLength($arrayOfLetters) . " ";


}
function determineTheStep($letter) {
   $coordinateX =0;
   $coordinateY = 0;
  switch ($letter)
   {
     case "A":
       $coordinateX +=  1;
       break;
     case "B" :
      $coordinateX +=  1/2;
      $coordinateY +=  sqrt(3)/2;
      break;
     case "F" :
      $coordinateX +=  1/2;
      $coordinateY -=  sqrt(3)/2;
      break;
    case "D":
      $coordinateX -=  1;
      break;
    case "C" :
      $coordinateX -=  1/2;
      $coordinateY +=  sqrt(3)/2;
      break;
    case "E" :
      $coordinateX -=  1/2;
      $coordinateY -=  sqrt(3)/2;
      break;
   }
   $arrayIntermediateCoordinates[] = $coordinateX;
   $arrayIntermediateCoordinates[] = $coordinateY;
   return $arrayIntermediateCoordinates;
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
