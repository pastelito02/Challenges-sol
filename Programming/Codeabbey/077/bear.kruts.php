<!--Author bear.kruts-->
<?php
    class CodeAbbey
    {
        protected static $_instance;
        private function __construct()
        {
        }
        private function __clone()
        {
        }
        public static function getInstance()
        {
            if (null === self::$_instance)
            {
                self::$_instance = new self();
            }
            return self::$_instance;
        }
        private function distMyPants($x1, $y1, $x2, $y2)
        {
            return pow(($x1 - $x2),2) + pow(($y1 - $y2),2);
        }
        public function ptsd($data)
        {
            $f = file( $data, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($f as $key => $value){
                list($x1, $y1, $x2, $y2, $xp, $yp) = explode(' ', $value);
                $length = self::distMyPants($x1, $y1, $x2, $y2);
                if ($length == 0)
                {
                    $result .= round(sqrt(self::distMyPants($xp, $yp, $x1, $y1)), 9)." ";
                }
                else
                {
                    $temp = (($xp - $x1) * ($x2 - $x1) + ($yp - $y1) * ($y2 - $y1)) / $length;
                    if ($temp < 0)
                    {
                        $result .= round(sqrt(self::distMyPants($xp, $yp, $x1, $y1)), 11)." ";
                    }
                    else
                    {
                        if ($temp > 1)
                        {
                            $result .= round(sqrt(self::distMyPants($xp, $yp, $x2, $y2)), 9)." ";
                        }
                        else
                        {
                            $temp_x = $x1 + $temp * ($x2 - $x1);
                            $temp_y = $y1 + $temp * ($y2 - $y1);
                            $result .= round(sqrt(self::distMyPants($xp, $yp, $temp_x, $temp_y)), 9)." ";
                        }
                    }
                }
            }
            return $result;
        }
    }

    echo CodeAbbey::getInstance()->ptsd('php://stdin');
