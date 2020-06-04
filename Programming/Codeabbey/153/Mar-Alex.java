//Author Mar-Alex
import java.util.Scanner;
import java.math.BigInteger;
 
public class Main {
   public static BigInteger sqrt(BigInteger x) {
    BigInteger div = BigInteger.ZERO.setBit(x.bitLength()/2);
    BigInteger div2 = div;
    for(;;) {
        BigInteger y = div.add(x.divide(div)).shiftRight(1);
        if (y.equals(div) || y.equals(div2))
            return y;
        div2 = div;
        div = y;
    }
 }
    
    public static void main(String[] args) {
           
        Scanner in = new Scanner(System.in);
        BigInteger p, q, n, e, d, fn, crypt, message;
        e = BigInteger.valueOf(65537);
        n = in.nextBigInteger();
        crypt = in.nextBigInteger();
        
        BigInteger sqrtN = sqrt(n).add(BigInteger.ONE);
        BigInteger k = BigInteger.valueOf(1);
        BigInteger x, sqrtX;
        while(true) {
            x = sqrtN.add(k);
            x = x.multiply(x);
            x = x.subtract(n);
            sqrtX = sqrt(x);
            if(sqrtX.multiply(sqrtX).equals(x)) {
                p = sqrtN.add(k).subtract(sqrtX);
                q = sqrtN.add(k).add(sqrtX);
                break;
            }
            k = k.add(BigInteger.ONE);
        }
        
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