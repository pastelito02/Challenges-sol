<!--Author pchelkin-->
<?php

$words = explode(' ', readline());
array_pop($words);
$result = [];

foreach ($words as $word) {
    if (!array_key_exists($word, $result)) {
        $result[$word] = 0;
    } else {
        $result[$word]++;
    }
}
ksort($result);
$result = array_keys(array_filter($result));

echo implode(' ', $result), PHP_EOL;
