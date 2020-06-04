<!--Author Dmytro Pryhornytskyi-->
<?php

$n=gmp_init(trim(fgets(STDIN))); $cipher=gmp_init(trim(fgets(STDIN))); $e=gmp_init(65537);

list($p,$q)=fermat($n); $phin=gmp_mul(gmp_sub($p,gmp_init(1)),gmp_sub($q,gmp_init(1))); $d=gmp_invert($e,$phin);

$text=strval(gmp_powm($cipher,$d,$n)); $p=0; do { $c=intval(substr($text,$p,2)); if ($c) echo chr($c); $p+=2; } while ($c);


function fermat($n)
{ $a=gmp_sqrt($n); $zero=gmp_init(0); $one=gmp_init(1);
  do { $a=gmp_add($a,$one); $b2=gmp_sub(gmp_mul($a,$a),$n); $q=gmp_sqrtrem($b2); } while (gmp_cmp($q[1],$zero));
  return array(gmp_sub($a,gmp_sqrt($b2)),gmp_add($a,gmp_sqrt($b2))); }

?>