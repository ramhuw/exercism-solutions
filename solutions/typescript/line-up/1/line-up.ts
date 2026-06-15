export function format(name: string, number: number): string {
  let place = ''
  if (number % 10 === 1 && number % 100 != 11) {
    place = number.toString() + 'st'
  } else if (number % 10 === 2 && number % 100 != 12) {
    place = number.toString() + 'nd'
  } else if (number % 10 === 3 && number % 100 != 13) {
    place = number.toString() + 'rd'
  } else {
    place = number.toString() + 'th'
  }
  return `${name}, you are the ${place} customer we serve today. Thank you!`
}
