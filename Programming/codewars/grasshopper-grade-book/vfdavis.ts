export function getGrade(a: number, b: number, c: number) {
  let avg = (a + b + c) / 3;
  return avg < 60
    ? 'F'
    : avg < 70
    ? 'D'
    : avg < 80
    ? 'C'
    : avg < 90
    ? 'B'
    : 'A';
}
