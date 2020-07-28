/*michaljuris*/
export function positiveSum(arr:number[]):number {
  return arr.filter((e) => e >= 0).reduce((acc, e) => acc + e , 0)
}
