<!--Author sergey.stanovsky-->
<?php
function getWinner($string){
    $results = explode(" ", $string);
    $count = 0;
    for($i=0;$i<count($results);$i++){
        /*if combination is RR PP SS $count remains the same*/
        if($results[$i]=='RR'||$results[$i]=='PP'||$results[$i]=='SS') continue;
        /*if combination is PR RS SP adds to $count -1*/
        if($results[$i]=='PR'||$results[$i]=='RS'||$results[$i]=='SP') $count-=1;
        /*if combination is RP SR PS adds to $count 1*/
        if($results[$i]=='RP'||$results[$i]=='SR'||$results[$i]=='PS') $count+=1;
    }
    if($count<0) return 1;
    if ($count>0) return 2;
    return 0;
}
$matches = 28;
$scores = [
"RP SP PP PR PR PR",
"SP SP PP SR RP RS SP RP PS SS PP PS SS PS",
"SP SP PR",
"RR RR SR RP SR RR RS SP RR PR SR SS RP SP RR PR PP PR",
"PS RS SR SS RP RR RR RP RR PP RR PR PS",
"SR SR SP PP PP PR SR PR RP RP",
"PR RP RP SP RR RP RP RP",
"SR PR PR PS RP RP RS RR SS PP PS SS SR",
"PP PR RP SP SS SP RP SS SS SS SP RR RR SR RR SP SP",
"SS PP SR PP PR PR SR RS SP RR SR RS",
"PS SR RP RR SP SR",
"RP RP PR SS SS PS",
"RR RR PP SR PR PP RP RS PP RS PP PS RR PS PP SS SS RR PS RS RS PR",
"SR PR RP SS RP",
"PR SR SP SP RS PS SP PR",
"RP PS PR RS PS PS",
"RR PR RR PR PS RR PR SR RR PP PR",
"SP SR PP RS SR PS",
"PR SR RR RP RS SP RR RP PR RS",
"PR PS SR RR RS SR",
"RP SP SR PP SP PS RS RP SR",
"SS SS RS RR PR PR",
"SR SP RR RS PS PP SS SP SS PS PP SP",
"RR PP RS RR PS PP RR RR SP SP PP PR",
"PS PR PS RP",
"SP RS SP SP",
"SP RS PS SR RP",
"PP RP SP SP SR RP SR PS"
];
for($i=0;$i<$matches;$i++){
    echo getWinner($scores[$i])." ";
}