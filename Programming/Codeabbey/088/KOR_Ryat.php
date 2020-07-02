<!--Author KOR_Ryat-->
$handle = fopen("./data.txt", "r");
$count = fgets($handle, 65536);
$notes = explode(' ',fgets($handle, 65536));
for($r=0;$r<$count;$r++){print round(440*pow(1.059463094,array_search(substr($notes[$r],0,-1),$index)-9)*pow(2,substr($notes[$r],-1,1)-4)).' ';}