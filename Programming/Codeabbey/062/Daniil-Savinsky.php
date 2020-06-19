<!--Author Daniil Savinsky-->
<?php
    
  $inputarray = "29
2034157 2339933
2034157 2506541
2378797 2397631
1504843 2629223
1700477 1962743
2705111 2746199
2132281 2528893
1988891 2020663
2447009 2528893
2311549 2679031
2447009 2746199
2562613 2746199
2705111 2723363
2528893 2578993
1604737 2147309
1744777 2447009
2563007 2705111
1872301 2447009
2528893 2625247
2156491 2240533
2378797 2562613
2506541 2563007
1684427 1996721
1854623 1898749
2182387 2237051
2571733 2629223
1444111 2489423
1872301 1951867
1473737 1782211"; 

  $inparr = explode("
", $inputarray);

  $prime_num = array();
  $j = 0 ;

  function prime($n){

    if ( $n == 2 )

      return true;

    if ( $n % 2 == 0 )

      return false;

    $i = 3;

    $max_factor = (int)sqrt($n);

    while ( $i <= $max_factor ){

      if ( $n % $i == 0 )

        return false;

      $i += 2;

    }

    return true;

  }

  function arrprime($max){

    $prime = [];

    for ( $i=2; $i <= $max; $i++ ){

      if ( prime($i) )

        $prime[] = $i;

    }

    return $prime;

  }
  
  $max = 3000000;
  $ml = arrprime($max);

  for ($i=1; $i < count($inparr); $i++) { 
    $str = explode(" ", $inparr[$i]);
    $a = $str[0];
    $b = $str[1];
    $count = 0 ;
    foreach ($ml as $key => $value) {
      if ($value >= $a && $value <= $b)
        $count ++;
    }
    echo $count." ";
  }
  
  ?>