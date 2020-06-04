<!--Author Dmytro Pryhornytskyi-->
<?php

$p=gmp_init(trim(fgets(STDIN))); $q=gmp_init(trim(fgets(STDIN))); $cipher=gmp_init(trim(fgets(STDIN))); $e=gmp_init(65537);

$n=gmp_mul($p,$q); $phin=gmp_mul(gmp_sub($p,gmp_init(1)),gmp_sub($q,gmp_init(1)));

$d=gmp_invert($e,$phin);

$text=strval(gmp_powm($cipher,$d,$n));

$p=0; do { $c=intval(substr($text,$p,2)); if ($c) echo chr($c); $p+=2; } while ($c);

?>