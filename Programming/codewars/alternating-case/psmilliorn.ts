/*psmilliorn*/
export function toAlternatingCase(s: string): string {
  return s.split("").map(a => a === a.toUpperCase()? a.toLowerCase(): a.toUpperCase()).join('')
}
