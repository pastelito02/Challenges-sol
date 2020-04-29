<!-- Author brayantqm123 -->
<?php

    $n = 24;

    $arreglo = "-86890 -4357895 11693 800 9780852 -220064 3992931 637 9886336 437 19491 1422 4155 1394 3175367 136 5904998 428 8736909 724 -2794141 -2805576 -3057894 2002264";

    $arreglo = explode(" ", $arreglo);
    $dividir = array();
    $i = 0;

    while($i < $n)
    {
        $dividir[] = $arreglo[$i] / $arreglo[$i+1];

        $i += 2;
    }

    foreach ($dividir as $div)
    {
        echo round($div) . ' ';
    }
?>
