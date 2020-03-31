//Author Serenade
import java.util.*;
class ShannonFanoCoding{
    static void doTree(NavigableSet<Map.Entry<Character, Integer>> sorted, String code){
        if(sorted.size() == 1){
            System.out.print((int)sorted.first().getKey() + " " + code + " ");
            return;
        }
        int sumOfSet = 0, sumOfSubSet = 0, index = 0;
        Map.Entry<Character, Integer> element = null;
        for(Map.Entry<Character, Integer> elem: sorted)
            sumOfSet += elem.getValue();
        for(Map.Entry<Character, Integer> elem: sorted){
            element = elem;
            if(2 * sumOfSubSet >= sumOfSet - elem.getValue() && index != 0) break;
            else sumOfSubSet += elem.getValue();
            index++;
        }
        doTree(sorted.headSet(element, false), code + "O");
        doTree(sorted.tailSet(element, true), code + "I");
    }
    public static void main(String args[]){
        TreeMap<Character, Integer> countOfCharacters = new TreeMap<>();
        try(Scanner sc = new Scanner(System.in)){
            String message = sc.nextLine();
            char ch;
            for(int i=0;i<message.length();i++){
                ch = message.charAt(i);
                if(countOfCharacters.containsKey(ch))
                    countOfCharacters.put(ch, countOfCharacters.get(ch) + 1);
                else countOfCharacters.put(ch, 1);
            }
        Comparator<Map.Entry<Character, Integer>> comp =
                            new Comparator<Map.Entry<Character, Integer>>(){
            public int compare(Map.Entry<Character, Integer> e1,
                               Map.Entry<Character, Integer> e2){
                int result = Integer.compare(e2.getValue(), e1.getValue());
                if(result == 0) return Integer.compare(e1.getKey(), e2.getKey());
                else return result;
            }
        };
        TreeSet<Map.Entry<Character, Integer>> sorted = new TreeSet<>(comp);
        sorted.addAll(countOfCharacters.entrySet());
            doTree(sorted, "");
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
