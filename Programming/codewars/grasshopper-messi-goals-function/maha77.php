<?php
function goals(int ...$args): int {
  return array_sum($args);
}
?>
