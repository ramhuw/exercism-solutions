export function steps(count: number): number {
  if (!Number.isInteger(count) || count <= 0) {
    throw 'Only positive integers are allowed'
  }
  if (count == 1) {
    return 0
  } else if(count % 2 == 0) {
    return steps(count / 2) + 1
  } else {
    return steps(3 * count + 1) + 1
  }
}
