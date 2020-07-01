<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
list($count,$deg) = explode(' ',fgets($handle,65536));
for($i=0;$i<$count;$i++){
    list($name,$x,$y) = explode(' ',fgets($handle,65536));
    $r = sqrt($x*$x+$y*$y);
    $theta = getdeg($x,$y) + $deg;
    $x = round($r*cos(deg2rad($theta)),10);
    $y = round($r*sin(deg2rad($theta)),10);

    $orderX[$name] = $x;
    $orderY[$name] = $y;
    $stars[$name] = array($x,$y);
}
array_multisort($orderY,SORT_ASC,$orderX,SORT_ASC,$stars);
foreach($stars as $idx=>$coord){print $idx.' ';}

function getdeg($x,$y){
    if($x<0){return rad2deg(atan($y/$x))+180;}
    if($x==0){return $y>0?90:270;}
    return rad2deg(atan($y/$x))+($y<0?360:0);
}