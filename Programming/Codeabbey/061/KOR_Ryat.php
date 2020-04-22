<!-- Author KOR_Ryat -->
<?php
$primeList = [2];
$p = 3;
$cnt = 1;

while ($cnt <= 200000) {
  $sqrt = sqrt($p);
  for ($i = 0; $i < $cnt; $i++) {
    if ($primeList[$i] > $sqrt) {
      for ($i = 0; $i < $count; $i++) {
        if ($cnt + 1 == $val[$i]) {
          $ans[$i] = $p;
          $acnt++;
        }
      }
      $primeList[] = $p;
      $cnt++;
      break;
    }
    if ($p % $primeList[$i] == 0) {
      break;
    }
  }
  if ($acnt == $count) {
    break;
  }
  $p += 2;
}

for ($i = 0; $i < $count; $i++) {
  print $ans[$i] . ' ';
}
