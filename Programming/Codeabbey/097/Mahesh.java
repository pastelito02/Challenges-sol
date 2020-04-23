//Author Mahesh
package com.practice;

import java.util.Scanner;

public class GirlsAndPigs {

  public static void main(final String[] args) {
    final Scanner scanner = new Scanner(System.in);
    final int testCases = scanner.nextInt();
    int legs = 0, breasts = 0, pigs = 0, girls = 0, results = 0, temp = 0;
    for (int i = 0; i < testCases; i++) {
      legs = scanner.nextInt();
      breasts = scanner.nextInt();
      results = 0;
      legs = legs / 2;
      for (girls = 1; girls < legs; girls++) {
        if (isEven(legs - girls)) {
          pigs = (legs - girls) / 2;
          temp = breasts - 2 * girls;
          if (temp % pigs == 0 && isEven(temp / pigs)) {
            // System.out.println("temp: "+temp+" pigs: "+pigs+" girls: "+girls);
            results++;
          }
        }
      }
      System.out.print(results + " ");
    }

  }

  private static boolean isEven(final int number) {
    return number%2 == 0;
  }

}
