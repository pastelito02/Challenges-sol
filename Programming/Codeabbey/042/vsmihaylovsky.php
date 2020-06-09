<!--Author vsmihaylovsky-->
<?php
    fscanf(STDIN, "%d\n", $test_cases_count);
    $result = '';
    for ($test_case_num = 0; $test_case_num < $test_cases_count; $test_case_num++) {
        $test_case = explode(' ', trim(fgets(STDIN)));
        $points = 'Bust';
        getPoints($test_case, $points);
        $result .= $points . ' ';
    }
    echo trim($result);

    function getPoints($test_case, &$result, $card_num = 0, $sum = 0) {
        if ($card_num == count($test_case)) {
            if (($sum < 22) && (($result == 'Bust') || ($sum > $result))) {
                $result = $sum;
            }
            return;
        }
        
        if ($test_case[$card_num] == 'A') {
            getPoints($test_case, $result, $card_num + 1, $sum + 1);
            getPoints($test_case, $result, $card_num + 1, $sum + 11);
        } elseif (strpos('TJQK', $test_case[$card_num]) !== false) {
            getPoints($test_case, $result, $card_num + 1, $sum + 10);
        } else {
            getPoints($test_case, $result, $card_num + 1, $sum + $test_case[$card_num]);
        }
    }
?>