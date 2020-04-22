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
        public function template($data)
        {
            $f = file( $data, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($f as $key => $value){
                list($D, $a, $b) = explode(' ', $value);
                $result .= round(($D * tan(deg2rad($b)) * tan(deg2rad($a))) / (tan(deg2rad($b)) - tan(deg2rad($a))))." ";
            }
            return $result;
        }
    }

    echo CodeAbbey::getInstance()->template('php://stdin');
