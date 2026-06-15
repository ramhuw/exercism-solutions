export function decodedResistorValue(arr: string[]): string {
  const a = map.get(arr[0])!
  const b = map.get(arr[1])!
  let c = map.get(arr[2])!
  let result = (a*10 + b) * 10**c
  if (result % 1000 === 0) {
    result /= 1000
    return `${result} kiloohms`
  } else {
    return `${result} ohms`
  }
}

console.log(decodedResistorValue(['red', 'black', 'red']))

const map = new Map([
  ['black', 0],
  ['brown', 1],
  ['red', 2],
  ['orange', 3],
  ['yellow', 4],
  ['green', 5],
  ['blue', 6],
  ['violet', 7],
  ['grey', 8],
  ['white', 9]
])


