<!-- Author Stefan_Schuster -->
<?php
$totalPairs = readline();
$results = [];
for ($i = 0; $i < $totalPairs; $i++) {
  $pair = explode(' ', readline());
  $dividend = $pair[0];
  $divisor = $pair[1];
  $results[] = round($dividend / $divisor);
  if ($results[$i] == -0) $results[$i] = 0;
}
echo implode(' ', $results);

?>
