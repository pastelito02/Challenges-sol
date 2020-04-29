<!-- Author volleyzorky -->
<?php
fgets(STDIN);
    $res = [];
    while ($line = trim(fgets(STDIN))) {
      $res[] = strlen($line) - strlen(str_replace(['a', 'o', 'u', 'i', 'e', 'y'], '', $line));
    }
    echo implode(' ', $res);
