//Walik
export class G964 {
  public static movie(card: number, ticket: number, perc: number): number {
  let k = 1, i = 1;
  while(Math.ceil(card + ticket *perc *k) >= ticket *i){
    k += Math.pow(perc, i);
     i++;
  }
  return i;
  };
}
