//Author relativity
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ShannonFanoCoding {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Encode code = new Encode(in.nextLine());
    }

}

class Encode{

    Map<Integer,Integer> map = new HashMap<>();
    ArrayList<Integer> list = new ArrayList<>();
    int[] sortedChars;
    String order = "";

    Encode(String str) {
        createMap(str);
        createOrderedArray();
        splitArray(sortedChars, "");
    }

    private void createMap(String str) {
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (map.containsKey((int)c)) map.put((int)c, map.get((int)c) + 1);
            else {
                map.put((int)c, 1);
            }
        }
    }

    private void createOrderedArray() {
        Map<Integer,Integer> tempMap = new HashMap();
        tempMap.putAll(map);
        while (!tempMap.isEmpty()) {
            int largestValue = Collections.max(tempMap.values());
            for (int i = 0; i < 128; i++) {
                if (tempMap.get(i) != null && tempMap.get(i) == largestValue) {
                    list.add(i);
                    tempMap.remove(i);
                }
            }
            Collections.sort(list);
            while (!list.isEmpty()) {
                order = order + list.get(0) + " ";
                list.remove(list.get(0));
            }
        }
        order = order.substring(0, order.length()-1);
        String[] sortedStringChars = order.split(" ");
        sortedChars = new int[sortedStringChars.length];
        for (int i = 0; i < sortedChars.length; i++) {
            sortedChars[i] = Integer.valueOf(sortedStringChars[i]);
        }
    }

    private void splitArray(int[] arr, String str) {
        int split;
        if (arr.length == 1) {
            System.out.print(arr[0] + " " + str + " ");
            return;
        }
        else split = findSplitPoint(arr);
        int [] leftArray = Arrays.copyOfRange(arr, 0, split);
        int [] rightArray = Arrays.copyOfRange(arr, split, arr.length);
        splitArray(leftArray, str + "O");
        splitArray(rightArray, str + "I");
    }

    private int findSplitPoint(int[] arr) {
        int min = Integer.MAX_VALUE;
        int total = 0;
        int temp = 0;
        int pos = 0;
        for (int i = 0; i < arr.length; i++) {
            total += map.get(arr[i]);
        }
        for (int i = 0; i < arr.length; i++) {
            temp += map.get(arr[i]);
            if ((Math.abs((total - temp) - temp)) < min) {
                min = Math.abs((total - temp) - temp);
                pos++;
            }
            else return pos;
        }
        System.out.print(" No minimum found ");
        return 0;
    }

}
