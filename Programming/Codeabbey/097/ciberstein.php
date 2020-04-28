<!-- Author ciberstein -->
<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
/*
PHP version 7.2.11.0

Linting with "SublimeLinter-PHP"

phpcs ciberstein.php

Compiling and linking using the "Command Windows prompt"

> C:\\..\php \\..\ciberstein.php
./output
*/
$input = fopen("./DATA.lst", "r");
$count = fgets($input, 65536);

for($r = 0 ; $r < $count ; $r++) {

  list($l, $b) = explode(' ', fgets($input, 128));
  $x = $b - $l;
  $var = array($x + 4);

  for($i = 2 ; $i <= $x / 2 ; $i++) {

    if($x % $i == 0){
      $var[] = $i + 4;
      $var[] = $x / $i + 4;
    }
  }

  $var = array_unique($var);
  $A = 0;

  foreach($var as $n) {

      if((int)($n / 2 ) == $n / 2 && ($n * $l / 4 - $b > 0)) {
      $A++;
    }
  }
  print $A.' ';
}
/*
./ciberstein.php
11 12 11 12 3 8 2 3 8 5 11 13 6 3 6
*/
?>
