//Author LotvinSergey
import java.util.HashMap;
import java.util.Scanner;

public class CA_VariableLengthCodeUnpack {

    public static void main(String[] args) {

        String str_input="0TOCE8R4I83GKJ989F67LH9U69QHOHKCG9906LS8Q6828K93GLES1F26HLCAH9E87312HKOCG2QOMSG489M0LE80TSJL2H4A5SJN44A2KAMO9EA81LF24SJN3G9J9E8B5PLF24P1GT892NQ011D89M0BEDP7L7871P6SS6S00AC1EQ5OE52SL58B2MIUCEKC84L30PKID";
        String initialStr=str_input;

        HashMap<String, String> hmA=new HashMap<String, String>();
        hmA.put("11", " ");
        hmA.put("1001", "t");
        hmA.put("10000", "n");
        hmA.put("0101", "s");
        hmA.put("01000", "r");
        hmA.put("00101", "d");
        hmA.put("001000", "!");
        hmA.put("000101", "c");
        hmA.put("000011", "m");
        hmA.put("0000100", "g");
        hmA.put("0000010", "b");
        hmA.put("00000001", "v");
        hmA.put("0000000001","k");
        hmA.put("000000000001", "q" );
        hmA.put("101", "e");
        hmA.put("10001", "o");
        hmA.put("011", "a");
        hmA.put("01001", "i");
        hmA.put("0011", "h");
        hmA.put("001001", "l");
        hmA.put("00011", "u");
        hmA.put("000100", "f");
        hmA.put("0000101","p");
        hmA.put("0000011", "w");
        hmA.put("0000001","y");
        hmA.put("000000001", "j");
        hmA.put("00000000001","x");
        hmA.put("000000000000","z");

        HashMap<String, String> hm32=new HashMap<String, String>();
        hm32.put("0", "00000");
        hm32.put("1", "00001");
        hm32.put("2", "00010");
        hm32.put("3", "00011");
        hm32.put("4", "00100");
        hm32.put("5", "00101");
        hm32.put("6", "00110");
        hm32.put("7", "00111");
        hm32.put("8", "01000");
        hm32.put("9", "01001");
        hm32.put("A", "01010");
        hm32.put("B", "01011");
        hm32.put("C", "01100");
        hm32.put("D", "01101");
        hm32.put("E", "01110");
        hm32.put("F", "01111");
        hm32.put("G", "10000");
        hm32.put("H", "10001");
        hm32.put("I", "10010");
        hm32.put("J", "10011");
        hm32.put("K", "10100");
        hm32.put("L", "10101");
        hm32.put("M", "10110");
        hm32.put("N", "10111");
        hm32.put("O", "11000");
        hm32.put("P", "11001");
        hm32.put("Q", "11010");
        hm32.put("R", "11011");
        hm32.put("S", "11100");
        hm32.put("T", "11101");
        hm32.put("U", "11110");
        hm32.put("V", "11111");


        String bits=""; char ch1; int l=initialStr.length();

        for (int i = 0; i < l; i++) {
           ch1=initialStr.charAt(0);
           initialStr=initialStr.substring(1, initialStr.length());
           bits=bits+hm32.get(String.valueOf(ch1));

        }
        //System.out.println(bits);
        String res="", tempStr=""; l=bits.length();
        for (int i = 0; i < l; i++) {

           tempStr=tempStr+bits.substring(i, i+1);
            if (hmA.containsKey(tempStr)) {
                res = res + hmA.get(tempStr);
                tempStr = "";
            }

        }
        System.out.println(res);
    }

}
