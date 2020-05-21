<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle,128);
for($r=0;$r<$count;$r++){
    unset($nums);
    $origin = trim(fgets($handle,128));
    for($i=0;$i<strlen($origin);$i++){$nums[] = hexdec($origin[$i]);}
    
    sort($nums);
    for($i=0;$i<strlen($origin);$i++){
        for($j=0;$j<strlen($origin);$j++){
            $pos = strrpos($origin,(string)strtoupper(dechex($nums[$j])));
            if(hexdec($origin[$i])<=$nums[$j]){continue 2;}
            if($pos<$i || ($i==0 && $nums[$j]==0)){continue;}
            break 2;
        }
    }
    print ($i==strlen($origin)?$origin:swap($origin,$i,$pos)).' ';

    rsort($nums);
    for($i=0;$i<strlen($origin);$i++){
        for($j=0;$j<strlen($origin);$j++){
            $pos = strrpos($origin,(string)strtoupper(dechex($nums[$j])));
            if(hexdec($origin[$i])>=$nums[$j]){continue 2;}
            if($pos<$i || ($i==0 && $nums[$j]==0)){continue;}
            break 2;
        }
    }
    print ($i==strlen($origin)?$origin:swap($origin,$i,$pos)).' ';
}

function swap($origin,$i,$j){
    $temp = $origin[$i];
    $origin[$i] = $origin[$j];
    $origin[$j] = $temp;
    return $origin;
}