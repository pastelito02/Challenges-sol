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
        public function vlcode($data)
        {
            $f = fopen( $data, 'r' );
            $str = str_split(fgets($f));

            $dict = [
                        ' ' => '11',             'e' => '101',
                        't' => '1001',           'o' => '10001',
                        'n' => '10000',          'a' => '011',
                        's' => '0101',           'i' => '01001',
                        'r' => '01000',          'h' => '0011',
                        'd' => '00101',          'l' => '001001',
                        '!' => '001000',         'u' => '00011',
                        'c' => '000101',         'f' => '000100',
                        'm' => '000011',         'p' => '0000101',
                        'g' => '0000100',        'w' => '0000011',
                        'b' => '0000010',        'y' => '0000001',
                        'v' => '00000001',       'j' => '000000001',
                        'k' => '0000000001',     'x' => '00000000001',
                        'q' => '000000000001',   'z' => '000000000000',
                    ];

            foreach ($str as $key => $value)
                $bin[$key] = $dict[$value];
            $strBin = implode("",  $bin);

            $chunks = str_split($strBin, 8);
            foreach ($chunks as $key => $value)
                if(strlen($value)!=8)
                    for($i=0; $i < 8-strlen($value); $i++)
                        $chunks[$key] .="0";

            foreach ($chunks as $key => $value)
            {
                $answer = strtoupper(dechex(bindec($value)));
                if(strlen($answer)<2)
                    $answer = "0".$answer;
                $result .= $answer." ";
            }

            return $result;
        }
    }

    echo CodeAbbey::getInstance()->vlcode('php://stdin');
