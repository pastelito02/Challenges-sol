export function goals(...args: number[]) {
  return args.reduce((a, b) => a + b);
}
