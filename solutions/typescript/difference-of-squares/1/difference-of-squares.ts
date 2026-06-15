export class Squares {
  private count: number
  constructor(count: number) {
    this.count = count;
  }

  get sumOfSquares(): number {
    let ans = 0
    for (let i = 1; i <= this.count; i++) {
      ans += i**2
    }
    return ans
  }

  get squareOfSum(): number {
    let ans = 0
    for (let i = 1; i <= this.count; i++) {
      ans += i
    }
    return ans**2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }
}
