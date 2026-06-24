export class Triangle {
  sides: number[]
  constructor(...sides: number[]) {
    this.sides = sides.sort()
  }

  get isIsosceles(): boolean {
    return this.sides[0] > 0 && this.sides[0] + this.sides[1] > this.sides[2] && (this.sides[1] === this.sides[2] || this.sides[0] === this.sides[1])
  }

  get isEquilateral(): boolean {
    return this.sides[0] > 0 && this.sides[1] === this.sides[2] && this.sides[0] === this.sides[1]
  }

  get isScalene() {
    return this.sides[0] > 0 && this.sides[0] + this.sides[1] > this.sides[2] && !this.isEquilateral
  }
}
