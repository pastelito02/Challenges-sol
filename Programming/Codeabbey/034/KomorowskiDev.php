<!--Author KomorowskiDev-->
<?php

// @author KomorowskiDev
// problems from www.codeabbey.com
// id34 binary-search

//CONTROLLER
//get data
$file=new File();
$input=$file->readToArrayOfString('id34.txt');
//find solution
if (!empty($input)){//if data exists
  $solution=new Solution($input);
  echo $solution->getSolution();// VIEW
}else{
  echo "<br>Data doesn't exists.";
}

//-------------CLASSES-----------------------------------

class Solution{ // MODEL

  protected $arrayOfString;

  public function __construct($input){
    $this->arrayOfString=$input;
  }

  public function getSolution(){
    unset($this->arrayOfString[0]);//remove first line
    $search=new BinarySearch();
    foreach ($this->arrayOfString as $line){
      $parameters=array_map("doubleval", explode(" ", $line));
      $search->setA($parameters[0]);
      $search->setB($parameters[1]);
      $search->setC($parameters[2]);
      $search->setD($parameters[3]);
      $solutionArray[]=$search->solution();
    }
    //return solution
    $delimiter=" ";
    return implode($delimiter, $solutionArray);
  }
}

class BinarySearch{
  protected $a;
  protected $b;
  protected $c;
  protected $d;

  public function solution(){
    $xMin=0;
    $xMax=100;
    do{
      $xMiddle=($xMin+$xMax)/2;
      $y=$this->countFunction($xMiddle);
      if($y>0){
        $xMax=$xMiddle;
      }else{
        $xMin=$xMiddle;
      }
    }while (abs($y)>0.0000001);
    return $xMiddle;
  }

  protected function countFunction($x){
    return ($this->a*$x)+($this->b*sqrt(pow($x, 3)))-($this->c*exp((0-$x)/50))-$this->d;
  }

  public function setA($value){
    $this->a=$value;
  }

  public function setB($value){
    $this->b=$value;
  }

  public function setC($value){
    $this->c=$value;
  }

  public function setD($value){
    $this->d=$value;
  }
}


//---------------------------------
/**
 * read data from file and insert to array
 * @author KomorowskiDev
 *
 */
class File{

  /**
   *
   * @param string $fileName
   * @throws Exception
   * @return array of string
   */
  public function readToArrayOfString($fileName){
    $input=array();
    try{
      if ( !file_exists($fileName) ) {
        throw new Exception("File $fileName not found.");
      }
      $handle = fopen($fileName, "r");
      if ($handle) {
        while (($line = fgets($handle)) !== false) {
          $input[]=$line;
        }
        fclose($handle);
      }else{
        throw new Exception("File $fileName open failed.");
      }
    }catch (Exception $e){
      echo $e->getMessage();
    }
    return $input;
  }
}
