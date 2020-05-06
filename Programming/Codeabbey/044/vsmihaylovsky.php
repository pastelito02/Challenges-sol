<!--Author vsmihaylovsky-->
<?php
  fscanf(STDIN, "%d\n", $str_count);
  $result = '';
  for ($i = 0; $i < $str_count; $i++) {
    fscanf(STDIN, "%d %d\n", $dice1, $dice2);
    $result .= $dice1 % 6 + $dice2 % 6 + 2 . ' ';
  }
  echo trim($result);
?>
