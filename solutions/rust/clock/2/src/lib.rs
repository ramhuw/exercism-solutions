use std::fmt;
#[derive(Debug)]
pub struct Clock {
    hours : i32,
    minutes : i32
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let start_clock = Self {
            hours: 0,
            minutes: 0
        };
        start_clock.add_minutes(hours * 60 + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let new_minutes = (self.minutes + minutes).rem_euclid(60);
        let new_hours = (self.hours + (minutes + self.minutes - new_minutes) / 60).rem_euclid(24);
        Self {
            hours: new_hours,
            minutes: new_minutes,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, clock: &Self) -> bool {
        self.hours == clock.hours && self.minutes == clock.minutes
    }
}