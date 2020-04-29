<!-- Author nick.ged03 -->
<form action="ex7.php" method="post">
 <p>Data:   <textarea label="Data" name="variables"></textarea></p>
 <p><input type="submit" /></p>
</form>

<?php
if(isset($_POST['variables'])) //проверка, переданы ли данные
{
    $str=[];
    $variables=explode("\n", $_POST['variables']); //превращаем данные в массив
    foreach($variables as $variable)
    {
        $str=explode(' ', $variable);
        $answer= round((int)($str[0])/(int)($str[1]),0);
        echo $answer.' ';
    }
}
?>
