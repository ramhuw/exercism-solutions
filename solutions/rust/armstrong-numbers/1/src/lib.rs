pub fn is_armstrong_number(num: u32) -> bool {
    let l = num.to_string().len() as u32;
    let mut n = num;
    let mut a = 0;
    while n != 0 {
        a += (n%10).pow(l);
        n /= 10;
    }
    a == num
}
