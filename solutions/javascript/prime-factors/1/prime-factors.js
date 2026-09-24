//
// This is only a SKELETON file for the 'Prime Factors' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const primeFactors = (n) => {
  let p = 2;
  let ps = [];
  while (n != 1) {
    while (n % p !== 0) {
      p++;
      if (p * p > n) {
        p = n;
      }
    }
    while (n % p === 0) {
      ps.push(p);
      n /= p;
    }
  }
  return ps;
};
