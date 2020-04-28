//Author Efistus
import java.util.*;

public class Efistus {

    public static void main(String[] args) {
        // TODO Auto-generated method stub

        String in = "ABRACADABRA";
        Scanner reader = new Scanner(System.in);

        String text = reader.nextLine();

        Shannon shannon = new Shannon(text);

    }

}

class Shannon {
    List<Letter> countList;
    Letter[] codeTable;

    public Shannon(String text) {
        countList = new ArrayList<>();

        String[] letters = new String[text.length()];
        for (int i = 0; i < text.length(); i++) {
            letters[i] = Character.toString(text.charAt(i));
        }

        for (String str : letters) {
            Letter letter = new Letter(str);
            if (countList.contains(letter)) {
                int index = countList.indexOf(letter);
                countList.get(index).increment();
            } else {
                countList.add(letter);
            }
        }
        Collections.sort(countList);

        codeTable = new Letter[countList.size()];
        int i = 0;

        for (Letter letter : countList) {
            codeTable[i] = letter;
            i++;
        }

        generateCodes(0, codeTable.length - 1, "");

        for (Letter letter : countList) {
            System.out.print(letter + " ");
        }
    }

    public void generateCodes(int left, int right, String code) {
        if (left == right) {
            codeTable[left].setCode(code);
            return;
        }

        int i = 0;
        int sum = 0;

        for (i = left; i <= right; i++) {
            sum += codeTable[i].getHowMany();
        }

        int sumLeft = 0;
        int sumRight = sum;

        for (i = left; i < right; i++) {
            sumLeft += codeTable[i].getHowMany();
            sumRight -= codeTable[i].getHowMany();

            if (sumLeft + codeTable[i + 1].getHowMany() >= sumRight - codeTable[i + 1].getHowMany()){
                break;
            }

        }
        int middle = i;

        if (Math.abs(sum - 2 * sumLeft) > Math.abs(sum - 2 * (sumLeft + codeTable[i + 1].getHowMany()))){
            middle = i + 1;
        }


        generateCodes(left, middle, code + "O");
        generateCodes(middle + 1, right, code + "I");
    }
}

class Letter implements Comparable<Letter> {
    private String character;
    private int ascii;
    private int howMany;
    private String code;

    public int getHowMany() {
        return howMany;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Letter(String character) {
        super();
        this.character = character;
        this.ascii = (int) character.charAt(0);
        this.howMany = 1;
    }

    @Override
    public int compareTo(Letter arg0) {
        // TODO Auto-generated method stub

        if (arg0.howMany != this.howMany) {
            return arg0.howMany - this.howMany;
        }

        return this.character.compareTo(arg0.character);
    }

    public void increment() {
        this.howMany++;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((character == null) ? 0 : character.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Letter other = (Letter) obj;
        if (character == null) {
            if (other.character != null)
                return false;
        } else if (!character.equals(other.character))
            return false;
        return true;
    }

    public String toString() {
        return ascii + " " + code;
    }

}
