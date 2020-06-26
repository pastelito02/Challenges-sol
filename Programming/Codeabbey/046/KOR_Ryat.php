<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 128);
for($i=0;$i<$count;$i++){
    unset($board);
    $res = 0;

    $order = explode(' ',fgets($handle, 128));
    for($j=0;$j<9;$j++){
        $board[$order[$j]-1] = ($j%2)+1;
        if(check($board)){$res = ($j+1); break;}
    }
    print $res.' ';
}
fclose($handle);

function check($arr){
    if($arr[0]!=0 && $arr[0]==$arr[3] && $arr[0]==$arr[6]){return 1;}
    if($arr[1]!=0 && $arr[1]==$arr[4] && $arr[1]==$arr[7]){return 1;}
    if($arr[2]!=0 && $arr[2]==$arr[5] && $arr[2]==$arr[8]){return 1;}
    if($arr[0]!=0 && $arr[0]==$arr[1] && $arr[0]==$arr[2]){return 1;}
    if($arr[3]!=0 && $arr[3]==$arr[4] && $arr[3]==$arr[5]){return 1;}
    if($arr[6]!=0 && $arr[6]==$arr[7] && $arr[6]==$arr[8]){return 1;}
    if($arr[0]!=0 && $arr[0]==$arr[4] && $arr[0]==$arr[8]){return 1;}
    if($arr[2]!=0 && $arr[2]==$arr[4] && $arr[2]==$arr[6]){return 1;}
    return false;
}