class Year {
  // Write your code for the 'Leap' exercise in this file.
  var year: Int
  init(calendarYear: Int) {
    self.year = calendarYear
  }
  var isLeapYear: Bool {
    (self.year % 100 != 0 && self.year % 4 == 0) || self.year % 400 == 0
  }
}
