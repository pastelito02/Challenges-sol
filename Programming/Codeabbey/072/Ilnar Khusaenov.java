//Author Ilnar Khusaenov
import java.util.Scanner;

public class Main {

    int[] numberInPosition (int numberOfNumbers, int x0){
        int[] mass = new int[4];
        int[] resMass = new int[numberOfNumbers];
        mass[0] = 445;
        mass[1] = 700001;
        mass[2] = 2097152;
        mass[3] = x0;
        for (int i = 0; i <numberOfNumbers ; i++) {

            mass[3] = (mass[0] * mass[3] + mass[1])%mass[2];
            resMass[i] = mass[3];
            //System.out.println(resMass[i]);
        }

        return resMass;
    }

    String[] word(int[] funnyNumbers, int[] length){
        String[] funnyWord = new String[length.length];
        String vowels= "aeiou";
        char[] vowelsArr = vowels.toCharArray();
        String consonant = "bcdfghjklmnprstvwxz";
        char[] consonantArr = consonant.toCharArray();
        int count = 0;
        for (int j = 0; j <length.length ; j++) {
            funnyWord[j] = "";
            for (int i = 0; i <length[j] ; i++) {
                if((i+1)%2==0){
                    funnyNumbers[count] = funnyNumbers[count] % 5;
                    funnyWord[j] += vowelsArr[funnyNumbers[count++]];
                }
                else{
                    funnyNumbers[count] = funnyNumbers[count] % 19;
                    funnyWord[j] += consonantArr[funnyNumbers[count++]];
                }
            }

        }
        return funnyWord;
    }

    public void run(){
        Scanner sc = new Scanner(System.in);
        int numTest = sc.nextInt();
        String[] funnyWords = new String[numTest];
        int x0 = sc.nextInt();
        int[] wordsLength = new int[numTest];
        int length=0;
        for (int i = 0; i <numTest ; i++) {
            wordsLength[i] = sc.nextInt();
            length+=wordsLength[i];
        }
        int[] funnyNumbers = numberInPosition(length, x0);

        funnyWords = word(funnyNumbers, wordsLength);

        for (int i = 0; i <funnyWords.length ; i++) {
            System.out.print(funnyWords[i] + " ");
        }

    }



    public static void main(String[] args) {
        new Main().run();
    }
}
