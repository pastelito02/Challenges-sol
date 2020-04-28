//Author damian_zb
import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by dbober on 9/7/2016.
 */
public class GirlsAndPigs   {
  public static void main(String[] args) throws FileNotFoundException {
    Scanner scanner = new Scanner(new File("C:/Windows/temp/tempFile.txt"));
    int howManyTimes = Integer.parseInt(scanner.nextLine());

    int ileRozwiazan = 0;
    Map<Integer, Integer> mapa = new LinkedHashMap<>();
    for (int iterator = 0; iterator < howManyTimes; iterator++) {
      String linia = scanner.nextLine();
      String[] tablicaStringow = linia.split("\\s");
      int numberOfLegs = Integer.parseInt(tablicaStringow[0]);
      int numberOfBreasts = Integer.parseInt(tablicaStringow[1]);


      for (int i = 1; i <= numberOfLegs - 4; i++) {
        //ileRozwiazan = 0;
        for (int j = 1; j < numberOfLegs - 1; j++) {
           if(2*i + 4*j != numberOfLegs) continue;
          for (int k = 2; k <= numberOfBreasts - 2; k += 2) {
            if(/*2*i + 4*j == numberOfLegs &&*/ 2*i + j*k == numberOfBreasts) {
              ileRozwiazan++;
              mapa.put(i, j);
            }
          }
        }
         // System.out.print(ileRozwiazan+" ");
      }
      System.out.print(ileRozwiazan+" ");
      ileRozwiazan = 0;
      mapa.clear();
    }
    scanner.close();
  }
}
