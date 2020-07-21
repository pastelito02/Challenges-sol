/*clowi*/
export function expressionsMatter(a: number, b: number, c: number): number {

   let one =  a * (b + c);
   let two = a * b * c;
   let three = (a + b) * c;
   let four = a + b + c;

   return Math.max(one, two, three, four);
}
