<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 65536);
for($r=0;$r<$count;$r++){
    $coord = explode(' ',fgets($handle, 65536));
    $king = array(ord(substr($coord[0],0,1)),substr($coord[0],1,1));
    $queen = array(ord(substr($coord[1],0,1)),substr($coord[1],1,1));
    $flag = false;
    for($i=-7;$i<8;$i++){
        if($king[0] == $queen[0]+$i && ($king[1] == $queen[1]+$i || $king[1] == $queen[1]-$i)){$flag = true;}
    }
    print (($flag || $king[0]==$queen[0] || $king[1] == $queen[1])?'Y':'N').' ';
}
fclose($handle);