//Author Ihor
public class VariableLengthCodeUnpack {
  private static final Map<Character, String> COMPRESS;
  private static final Map<String, Character> DECOMPRESS;

  static {
      COMPRESS = new HashMap<>();
      DECOMPRESS = new HashMap<>();

      DECOMPRESS.put("11", ' ');
      DECOMPRESS.put("1001", 't');
      DECOMPRESS.put("10000", 'n');
      DECOMPRESS.put("0101", 's');

      DECOMPRESS.put("01000", 'r');
      DECOMPRESS.put("00101", 'd');
      DECOMPRESS.put("001000", '!');
      DECOMPRESS.put("000101", 'c');

      DECOMPRESS.put("000011", 'm');
      DECOMPRESS.put("0000100", 'g');
      DECOMPRESS.put("0000010", 'b');
      DECOMPRESS.put("00000001", 'v');

      DECOMPRESS.put("0000000001", 'k');
      DECOMPRESS.put("000000000001", 'q');
      DECOMPRESS.put("101", 'e');
      DECOMPRESS.put("10001", 'o');

      DECOMPRESS.put("011", 'a');
      DECOMPRESS.put("01001", 'i');
      DECOMPRESS.put("0011", 'h');
      DECOMPRESS.put("001001", 'l');

      DECOMPRESS.put("00011", 'u');
      DECOMPRESS.put("000100", 'f');
      DECOMPRESS.put("0000101", 'p');
      DECOMPRESS.put("0000011", 'w');

      DECOMPRESS.put("0000001", 'y');
      DECOMPRESS.put("000000001", 'j');
      DECOMPRESS.put("00000000001", 'x');
      DECOMPRESS.put("000000000000", 'z');


      COMPRESS.put('0', "00000");
      COMPRESS.put('1', "00001");
      COMPRESS.put('2', "00010");
      COMPRESS.put('3', "00011");

      COMPRESS.put('4', "00100");
      COMPRESS.put('5', "00101");
      COMPRESS.put('6', "00110");
      COMPRESS.put('7', "00111");

      COMPRESS.put('8', "01000");
      COMPRESS.put('9', "01001");
      COMPRESS.put('A', "01010");
      COMPRESS.put('B', "01011");

      COMPRESS.put('C', "01100");
      COMPRESS.put('D', "01101");
      COMPRESS.put('E', "01110");
      COMPRESS.put('F', "01111");

      COMPRESS.put('G', "10000");
      COMPRESS.put('H', "10001");
      COMPRESS.put('I', "10010");
      COMPRESS.put('J', "10011");

      COMPRESS.put('K', "10100");
      COMPRESS.put('L', "10101");
      COMPRESS.put('M', "10110");
      COMPRESS.put('N', "10111");

      COMPRESS.put('O', "11000");
      COMPRESS.put('P', "11001");
      COMPRESS.put('Q', "11010");
      COMPRESS.put('R', "11011");

      COMPRESS.put('S', "11100");
      COMPRESS.put('T', "11101");
      COMPRESS.put('U', "11110");
      COMPRESS.put('V', "11111");
  }

  public static void main(final String[] args) {
    final Scanner sc = new Scanner(System.in);
    final String s = sc.nextLine();
    sc.close();
    printResult(decompress(s));
  }

  private static StringBuilder decompress(final String s) {
    final char[] array = s.toCharArray();
    final StringBuilder sbRes = new StringBuilder();
    final StringBuilder bitStream = new StringBuilder();
    for (final char c : array)
      bitStream.append(COMPRESS.get(c));
    final String bitSequence = bitStream.toString();
    bitStream.setLength(0);
    final char[] bitsArray = bitSequence.toCharArray();
    for (final char bit : bitsArray) {
      bitStream.append(bit);
      if (DECOMPRESS.containsKey(bitStream.toString())) {
        sbRes.append(DECOMPRESS.get(bitStream.toString()));
        bitStream.setLength(0);
      }
    }
    return sbRes;
  }

  private static void printResult(final StringBuilder res) {
      System.out.println(res);
  }
}
