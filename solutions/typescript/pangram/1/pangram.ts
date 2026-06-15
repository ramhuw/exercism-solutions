export function isPangram(s: string): boolean {
  return (new Set([...s.toLowerCase()].filter(isLetter))).size === 26
}

function isLetter(c: string): boolean {
  return c.toLowerCase() !== c.toUpperCase()
}