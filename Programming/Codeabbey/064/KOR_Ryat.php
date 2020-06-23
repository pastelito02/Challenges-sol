<!--Author KOR_Ryat-->
$dir = array(array(-1,0),array(0,1),array(1,0),array(0,-1));
$dirL = array('U','R','D','L');

$handle = fopen("./data.txt", "r");
list($x,$y) = explode(' ',fgets($handle,256));
for($r=0;$r<$y;$r++){$tile[] = fgets($handle,65536);}

$start = array(array(0,$x-1),array($y-1,0),array($y-1,$x-1));
for($r=0;$r<3;$r++){
    $pos = $start[$r];
    $phase = $step = 0;
    $log = array(-1);
    while(true){
        $next = -1;
        for($i=$log[$step]!=-1?($log[$step]+1):0;$i<4;$i++){
            if($pos[0]+$dir[$i][0] < 0 || $pos[0]+$dir[$i][0] > $y-1 || $pos[1]+$dir[$i][1] < 0 || $pos[1]+$dir[$i][1] > $x-1 || $tile[$pos[0]+$dir[$i][0]][$pos[1]+$dir[$i][1]]==0 || ($step>0 && $log[$step-1] != $i && $log[$step-1]%2 == $i%2)){continue;}
            $next = $i; break;
        }
        if($next == -1){
            $pos = array($pos[0]-$dir[$log[$step-1]][0],$pos[1]-$dir[$log[$step-1]][1]);
            $step--;
            continue;
        }

        $log[$step] = $next;
        $log[$step+1] = -1;
        $step++;
        $pos = array($pos[0]+$dir[$next][0],$pos[1]+$dir[$next][1]);

        if($pos[0]==0 && $pos[1]==0){break;}
    }

    for($i=0;$i<$step;$i++){
        $stack++;
        if($log[$i] != $log[$i+1]){
            print $stack.$dirL[$log[$i]];
            $stack = 0;
        }
    }
    print ' ';
}