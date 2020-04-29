<!-- Author m.sidorenko -->
<?php
$data = explode("\n", file_get_contents('php://stdin'));
$counter=$data[0];
array_shift($data);
$rez=[];
for($i=0;$i<$counter;$i++){
  $line = explode(' ', $data[$i]);
  $rez[] = round($line[0]/$line[1],0);
}
echo join(' ', $rez);
