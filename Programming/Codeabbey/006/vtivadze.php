<!-- Author vtivadze -->
<?php

$rslt = "";
while ($row = fgets(STDIN)) {

    $data = preg_split("/ /", $row);
    if (count($data) != 2) continue;

    $rslt .= round($data[0] / $data[1]);
    $rslt .= " ";

}

echo substr($rslt, 0, -1);

?>
