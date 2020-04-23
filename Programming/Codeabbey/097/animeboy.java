//Author animeboy
import java.util.Scanner;

public class animeboy {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    in.nextInt();

    while(in.hasNextInt()) {
      int legs = in.nextInt();
      int breasts = in.nextInt();
      calculate(legs, breasts);
    }
  }

  public static void calculate(int legs, int breasts) {
    int count = 0;
    for (int pigs = 1; pigs <= breasts - legs; pigs++) {
      int pigbreasts = (breasts-legs)/pigs + 4;
      int girls = (legs - 4*pigs)/2;
      if (plugVariables(girls, pigs, pigbreasts, legs, breasts)) {
        //System.out.print("P " + pigs + " G " + girls+ " ");
        count++;
      }
    }
    System.out.print(count + " ");
  }

  public static boolean plugVariables(int girls, int pigs, int pigbreasts, int legs, int breasts) {
    if (girls <= 0 || pigs <= 0 || pigbreasts % 2 == 1) {
      return false;
    }

    boolean equalLegs = 2*girls + 4*pigs == legs;
    boolean equalBreasts = 2*girls + pigbreasts*pigs == breasts;
    return equalLegs && equalBreasts;
  }
}
