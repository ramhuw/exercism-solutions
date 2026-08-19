pub fn find(array: &[i32], key: i32) -> Option<usize> {
    if array.is_empty() {
        return None;
    }
    let mut left = 0;
    let mut right = array.len() - 1;
    while left < right {
        let middle = (left + right + 1) / 2;
        if array[middle] == key {
            return Some(middle);
        } else if array[middle] < key {
            left = middle;
        } else {
            right = middle - 1;
        }
    }
    if left < array.len() && array[left] == key {
        return Some(left);
    } else {
        None
    }
}
