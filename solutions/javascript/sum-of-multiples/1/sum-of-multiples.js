//
// This is only a SKELETON file for the 'Sum Of Multiples' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const sum = (arr, limit) => {
  const d = Array.from({ length: limit }, (_, i) => false);
  for (const a of arr) {
    let b = a
    while (b != 0 && b < limit) {
      d[b] = true;
      b += a;
    }
  }
  let ans = 0;
  for (let i = 0; i < limit; i++) {
    if (d[i]) {
      ans += i;
    }
  }
  return ans;
};
