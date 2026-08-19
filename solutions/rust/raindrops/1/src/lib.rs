use std::fmt::Write;
pub fn raindrops(n: u32) -> String {
    let f1 = n % 3 == 0;
    let f2 = n % 5 == 0;
    let f3 = n % 7 == 0;
    if !(f1 || f2 || f3) {
        return n.to_string();
    }
    let mut ans = String::new();
    if f1 {
        write!(ans, "Pling").unwrap();
    }
    if f2 {
        write!(ans, "Plang").unwrap();
    }
    if f3 {
        write!(ans, "Plong").unwrap();
    }
    ans
}
