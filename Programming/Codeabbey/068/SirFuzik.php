<!--Author SirFuzik-->
<?
$b = $_POST['pari'];
$itog = preg_split("/\n/",$b,-1,PREG_SPLIT_NO_EMPTY);
$a = count($itog);
for($i=0;$i<$a;$i++)
{
  $dynam = preg_split("/ /",$itog[$i],-1,PREG_SPLIT_NO_EMPTY);
  $s = $dynam[0];
  $v1 = $dynam[1];
  $v2 = $dynam[2];
  $t = $s / ($v1+$v2);
  $ind = $v1 * $t;
    $answer[$i]=$ind;
    unset($ind);
}
$otvet = implode(" ",$answer);
echo $otvet;
?>
<html>
<form method="POST">
<textarea name=pari cols=50 rows=25>
</textarea>
<br>
<input type=submit>
</form>
</html>
