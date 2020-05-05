<!--Author -->
<?php
    function cukup($s, $r, $p){
    $tahun1 = 1;
    $counter = 0;
    //$bunga = $s * ($p/100) * $tahun1;
    //$total_uang = $s+$bunga;
    //secho $total_uang;

    do{
      $bunga = $s * ($p/100) * $tahun1;
      $s = round(($s+$bunga),2);
      $counter++;
      //echo $s."<br>";
    } while($s<$r);

    //echo "$s &nbsp;";
    echo $counter."&nbsp;";

  }

  cukup( 250,3000 ,10 );
  cukup( 100,1000,1 );
  cukup( 5000, 90000,10 );
  cukup( 250,1000 , 25 );
  cukup( 2500, 27500,6 );
  cukup( 25, 400 ,3 );
  cukup( 100, 1800,5 );
  cukup( 25, 275, 6);
  cukup( 10000,60000 , 9);
  cukup( 10000, 130000, 1);
  cukup( 25, 200, 40);
  cukup( 5000,90000 , 4);
  cukup( 25, 325, 5);
  cukup( 100,200 , 15);
  cukup( 50, 600,6 );
  cukup( 500,1000 , 15);
?>
