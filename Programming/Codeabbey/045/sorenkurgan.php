<!--Author sorenkurgan-->
<?php
        $suits = array('C', 'D', 'H', 'S');
        $ranks = array('A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K');
        $input = "68 6435 44 312 62 5063 9124 6298 748 269 9102 8680 429 8887 8297 100 972 578 1000 6966 571 43 144 6 7078 816 98 9685 627 4632 129 965 9 514 43 71 41 49 193 451 8865 52 9510 513 345 338 431 5744 541 61 2991 98";
        $numbers = array_map('floatval', explode(' ', $input));
        $i = 0;
        $cards = array();
        foreach ($suits as $suit) {
            foreach ($ranks as $rank) {
                $cards[$i] = $suit . $rank;
                $i++;
            }
        }

        foreach ($cards as $value) {
            echo $value . " ";
        }

        $i = 0;
        foreach ($numbers as $value) {
            $temp = $cards[$i];
            $cards[$i] = $cards[$value % 52];
            $cards[$value % 52] = $temp;
            $i++;
        }
echo "<br>";
        foreach ($cards as $value) {
            echo $value . " ";
        }
        ?>