/*smoc*/
const seconds = (s: number) => s * 1000;
const minutes = (m: number) => m * seconds(60);
const hours = (h: number) => h * minutes(60);

export function past(h: number, m: number, s: number): number {
  return hours(h) + minutes(m) + seconds(s);
}
