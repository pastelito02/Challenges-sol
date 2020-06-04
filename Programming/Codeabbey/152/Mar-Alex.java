//Author Mar-Alex
import java.util.Scanner;
import java.math.BigInteger;
 
public class Main {
   
    public static void main(String[] args) {
           
        Scanner in = new Scanner(System.in);
        BigInteger p, q, n, e, d, fn, crypt, message;
        e = BigInteger.valueOf(65537);
        p = in.nextBigInteger();
        q = in.nextBigInteger();
        crypt = in.nextBigInteger();
        n = p.multiply(q);
        fn = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
        d = e.modInverse(fn);
        message = crypt.modPow(d, n);
        String stringMessage = message.toString();
        char decodedMessage[] = new char[stringMessage.length() / 2];
        int value = 1;
        for(int i = 0 ; i < stringMessage.length() && value != 0; i+=2) {
            value = Character.getNumericValue(stringMessage.charAt(i)) * 10 + Character.getNumericValue(stringMessage.charAt(i + 1));
            decodedMessage[i/2] = (char) value;
        }
        System.out.printf(new String(decodedMessage));
        
        in.close();
    }
}