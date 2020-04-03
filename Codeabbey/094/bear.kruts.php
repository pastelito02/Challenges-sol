<!-- Author bear.kruts -->
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
        public function foolsDay($data)
        {
            $f = file( $data, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($f as $key => $value){
                $parameters = explode(' ', $value);
                $total = 0;
                for ($x = 0; $x < count($parameters); $x++)
                    $total += pow($parameters[$x],2);
                $result .= $total." ";
            }
            return $result;
        }
    }

    echo CodeAbbey::getInstance()->foolsDay('php://stdin');
