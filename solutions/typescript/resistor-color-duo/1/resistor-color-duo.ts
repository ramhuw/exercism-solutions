export function decodedValue(colors: string[]) {
  let n1 = colors[0] ? String(COLORS.indexOf(colors[0])) : "";
  let n2 = colors[1] ? String(COLORS.indexOf(colors[1])) : "";
  return Number(n1 + n2);
}

export const COLORS: string[] = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
]