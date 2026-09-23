module Leap

let leapYear (year: int): bool = (year % 100 <> 0 && year % 4 = 0 || year % 400 = 0)