export function age(planet: string, seconds: number): number {
  return Math.round(100 * (seconds / 31557600) / (map.get(planet) ?? 1)) / 100
}

const map = new Map([
  ['mercury', 0.2408467],
  ['venus', 0.61519726],
  ['earth', 1.0],
  ['mars', 1.8808158],
  ['jupiter', 11.862615],
  ['saturn', 29.447498],
  ['uranus', 84.016846],
  ['neptune', 164.79132]
])
