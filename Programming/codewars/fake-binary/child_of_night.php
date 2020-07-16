<?php
#child_of_night
function fake_bin(string $s): string {
  return preg_replace(array('/[0-4]/', '/[5-9]/'), array('0', '1'), $s);
}
?>
