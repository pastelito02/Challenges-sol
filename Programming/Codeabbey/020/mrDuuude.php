<!-- Author mrDuuude -->
<?php

$counter = readline("Paste counter here: ");
$array = [];

for ($i = 0; $i < $counter; $i++) {
  $array[$i] = readline("Paste data here: ");
}

foreach ($array as $line) {
  $cnt = 0;

  for ($i = 0; $i < strlen($line); $i++) {
    if (in_array($line{$i}, ['a', 'o', 'u', 'i', 'e', 'y'])) {
      $cnt++;
    }
  }
  echo $cnt . ' ';
}

echo "\n";
