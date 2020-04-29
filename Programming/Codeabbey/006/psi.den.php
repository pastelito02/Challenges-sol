<!-- Author psi.den -->
<?php

    $input = fread(fopen("php://stdin","r"), 4096);

    $input = explode("\n", $input);

    $result = array();
    $result2 = array();

    foreach ($input as $value){
        $result[] = explode(" ", $value);
    }
    foreach ($result as $value){
        $result2[] = round($value[0]/$value[1]);
    }
    foreach ($result2 as $value){
        echo $value." ";
    }

?>
