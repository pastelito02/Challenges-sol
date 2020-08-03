export function squareSum(numbers: number[]): number {
  return numbers.reduce((prev, curr) => prev + curr * curr, 0);
}
