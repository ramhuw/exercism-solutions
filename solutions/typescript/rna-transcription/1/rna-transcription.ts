export function toRna(dna: string): string {
  return [...dna].map(c => toComplement(c)).join("")
}

function toComplement(n: string): string {
  switch (n) {
    case 'A':
      return 'U';
    case 'C':
      return 'G';
    case 'G':
      return 'C'
    case 'T':
      return 'A'
    default:
      throw 'Invalid input DNA.'
  }
}
