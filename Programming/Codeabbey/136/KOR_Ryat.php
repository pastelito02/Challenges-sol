<!-- Author KOR_Ryat -->
$rIndex = array(' '=>'11','e'=>'101','t'=>'1001','o'=>'10001','n'=>'10000','a'=>'011','s'=>'0101','i'=>'01001','r'=>'01000','h'=>'0011','d'=>'00101','l'=>'001001','!'=>'001000','u'=>'00011','c'=>'000101','f'=>'000100','m'=>'000011','p'=>'0000101','g'=>'0000100','w'=>'0000011','b'=>'0000010','y'=>'0000001','v'=>'00000001','j'=>'000000001','k'=>'0000000001','x'=>'00000000001','q'=>'000000000001','z'=>'000000000000');
foreach($rIndex as $str=>$code){
    $target = &$index;
    for($i=0;$i<strlen($code);$i++){$target = &$target[$code[$i]];}
    $target = $str;
}

$handle = fopen("./data.txt", "r");
$string = fgets($handle,65536);
$len = strlen($string);
for($i=$len-1;$i>=0;$i--){
    $x = $string[$i]>='A'?(ord($string[$i])-55):$string[$i];
    for($j=0;$j<5;$j++){
        $bin[$i*5-$j+4] = $x%2;
        $x = (int)($x/2);
    }
}

$pos = 0;
$target = $index;
while($pos<$len*5){
    $target = $target[$bin[$pos]];
    if(!is_array($target)){
        $msg .= $target;
        $target = $index;
    }
    $pos++;
}
print $msg;
