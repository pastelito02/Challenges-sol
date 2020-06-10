<!--Author Dant12345-->
<?php

/**
 * Life is Simple
 * Problem #56
 */

$a = $_POST['text'];
$a = explode("\n", $a);
$a = array_map('trim',$a);
$arr = [];

foreach ($a as $value) {

    $arr[] =  str_split($value);
}

$array = array_fill(0, 20 , "-");

foreach($array as $key => $value) {
    $array[$key] = array_fill(0,20,"-");
}


function fillTheArray($arr , $array) {

    for ($i = 6, $x =0; $i<=10 ; $i++, $x++ ) {
        for ($j= 6, $y = 0;   $j<= 12 ; $j++, $y++) {
            $arr[$i][$j] = $array[$x][$y];
        }
    }
    return $arr;
}

function searchLife($array){

    $organism = "X";
    for ($i = 0; $i<=20; $i++) {
        for ($j = 0 ; $j <= 20; $j++) {
            $arrayNeighbors = searchArrayNeighbors($array, $i ,$j);

            $countOrganism = searchElem($arrayNeighbors, $organism);

            if ($array[$i][$j] === '-' &&  $countOrganism == 3 ) {
                $arrayOrganism[] = $i."and".$j;

            }
            if ($array[$i][$j] == 'X' &&
                ($countOrganism == 2  || $countOrganism ==3)) {
                $arrayOrganism[] = $i."and".$j;
            }
        }

    }
    return $arrayOrganism;
}
function searchArrayNeighbors($array ,$i ,$j) {

    $arrayNeighbors[] = $array[$i][$j-1];
    $arrayNeighbors[] = $array[$i][$j+1];
    $arrayNeighbors[] = $array[$i+1][$j];
    $arrayNeighbors[] = $array[$i-1][$j];
    $arrayNeighbors[] = $array[$i+1][$j-1];
    $arrayNeighbors[] = $array[$i+1][$j+1];
    $arrayNeighbors[] = $array[$i-1][$j-1];
    $arrayNeighbors[] = $array[$i-1][$j+1];

    return $arrayNeighbors;
}

function searchElem($array,$elem) {
    $count = 0;
    for ($i =0 ; $i < count($array); $i++ ) {
        if ($array[$i] === $elem) {
            $count++;
        }
    }
    return $count;
}


function killAllOrganism($array) {

    for ($i = 0; $i<=20; $i++) {
        for ($j = 0 ; $j <= 20; $j++) {
            $array[$i][$j] = "-";
        }
    }
    return $array;
}


function fillLifeOrganism($array,$arrayLifeOrganism)
{
    foreach ($arrayLifeOrganism as $value) {
        $value = explode("and", $value);
        $array[$value[0]][$value[1]] = "X";
    }
    return $array;
}



$res = fillTheArray($array, $arr);
for ($k =0 ; $k< 5; $k++) {
    $step = searchLife($res);
    echo count($step) . " ";
    $emptyArray = killAllOrganism($res);
    $res = fillLifeOrganism($emptyArray,$step);
}

//16 18 16 21 17
?>
<html>
<form method="POST">
<textarea name='text' cols=50 rows=20 >
</textarea>
    <br>
    <input type=submit>
</form>
</html>