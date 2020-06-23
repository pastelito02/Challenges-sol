<!--Author KomorowskiDev-->
<?php

// @author KomorowskiDev
// problems from www.codeabbey.com
// id40 paths-in-the-grid

//CONTROLLER

//get data
$file=new File();
$file->setLinesToSkip(1);
$input=$file->readToArrayOfString('id40.txt');

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
        //$solutionArray=array();
        $row=0;
        foreach ($this->arrayOfString as $line){
            $data=explode(" ", $line);
            $column=0;
            foreach($data as $value){
                $field[$row][$column]=trim($value);
                $column++;
            }
            $row++;
        }
        $paths=new PathsInTheGrid();
        $solution=$paths->findPaths($field);
        //$delimiter=" ";
        //return implode($delimiter, $solutionArray);
        return $solution;
    }
}    

class PathsInTheGrid{
    
    public function findPaths($field){
        $roads=0;
        if ($this->canGo($field, 0, 0, true)){//east
            $roads+=$this->move($field, 0, 0, true);
        }
        if ($this->canGo($field, 0, 0, false)){//south
            $roads+=$this->move($field, 0, 0, false);
        }
        echo $roads;
    }
    
    protected function move(&$field, $row, $column, $goEast){
        $roads=0;
        if ($goEast){
            $column++;
        }else{
            $row++;
        }
        if ($field[$row][$column]=="$"){ //finish
            $roads=1;
        }else{ // next step
            if ($this->canGo($field, $row, $column, true)){//east
                $roads+=$this->move($field, $row, $column, true);
            }
            if ($this->canGo($field, $row, $column, false)){//south
                $roads+=$this->move($field, $row, $column, false);
            }
        }
        return $roads;
    }
    
    protected function canGo($field, $row, $column, $goEast){
        if ($goEast){
            $column++;
        }else{
            $row++;
        }
        $impossible="X";
        $response=false;
        if (isset($field[$row][$column])){
            if ($field[$row][$column] != $impossible){
                $response=true;
            }
        }
        return $response;
    }
}

//---------------------------------
/**
 * read data from file and insert to array
 * @author KomorowskiDev
 *
 */
class File{
    protected $linesToSkip;
    
    public function __construct(){
        $this->linesToSkip=0;
    }
    
    /**
     * setting how many lines should be skipped
     * @param int $number
     */
    public function setLinesToSkip($number){
        $this->linesToSkip=intval($number);
    }

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
                $i=1;
                while (($line = fgets($handle)) !== false) {
                    if ($i>$this->linesToSkip){
                        $input[]=$line;
                    }
                    $i++;
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
