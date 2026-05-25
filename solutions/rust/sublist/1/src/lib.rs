#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(first_list: &[i32], second_list: &[i32]) -> Comparison {
    if first_list.len() > second_list.len() {
        if sl(second_list, first_list) {
            Comparison::Superlist
        } else {
            Comparison::Unequal
        }
    } else if first_list.len() == second_list.len() {
        if first_list == second_list {
            Comparison::Equal
        } else {
            Comparison::Unequal
        }
    } else {
        if sl(first_list, second_list) {
            Comparison::Sublist
        } else {
            Comparison::Unequal
        }
    }
}

fn sl(a: &[i32], b: &[i32]) -> bool {
    (0..=(b.len() - a.len()))
        .map(|n| &b[n..(n + a.len())])
        .any(|s| s == a)
}
