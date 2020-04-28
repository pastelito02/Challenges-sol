<?php

$data = explode("\n", file_get_contents('php://stdin'));
$n = (int) $data[0];
$arr = explode(" ", $data[1]);
$max_num = (int) max($arr);
//echo $max_num;
//return;
$prime_ar = array(2, 3, 5, 7);
$cnt = 4;

$nx_try = $prime_ar[count($prime_ar) - 1] + 2;
while ($cnt < 50000) {

  $flag = 0;

  for ($i = 0; $i < count($prime_ar); $i++) {

    if (pow($prime_ar[$i], 2) <= $nx_try) {

      if ($nx_try % $prime_ar[$i] == 0) {

        $flag = 1;
        break;
      }
    } else {
      break;
    }
  }



  if ($flag == 0) {
    $cnt = $cnt + 1;
    $prime_ar[] = $nx_try;
  }


  $nx_try = $nx_try + 2;
}


for ($i = 0; $i < count($arr); $i++) {

  echo $prime_ar[$arr[$i]] . " ";
}
